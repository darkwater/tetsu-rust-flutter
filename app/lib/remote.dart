import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:graphql/client.dart';
import 'package:hive/hive.dart';
import 'package:http/io_client.dart';

part 'remote.g.dart';

@HiveType(typeId: 0)
class Remote {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String fingerprint;
  @HiveField(2)
  final String jwt;
  @HiveField(3)
  String name;
  @HiveField(4)
  String? addr;

  final Completer<_RemoteConnection> _remoteConn = Completer();
  Future<Link> get gqlLink async => (await _remoteConn.future).gqlLink;

  Completer<void>? _attemptingConnection;

  Remote(
    this.id,
    this.fingerprint,
    this.jwt, {
    this.name = "<unknown>",
    this.addr = "sinon.fbk.red:39547",
  });

  IOClient _initHttpClient() {
    final secContext = SecurityContext();
    final inner = HttpClient(context: secContext)
      ..badCertificateCallback = (cert, host, port) {
        final certFingerprint = sha256.convert(cert.der).toString();

        return fingerprint == certFingerprint;
      };

    return IOClient(inner);
  }

  Future<bool> connect(String name, String? addr) async {
    await _attemptingConnection?.future;
    _attemptingConnection = Completer();

    final authority = addr ?? this.addr!;
    final url = Uri.https(authority, "/info");

    final res = await _initHttpClient().get(url, headers: {
      "Authorization": "Bearer $jwt",
    });

    final httpClient = _initHttpClient();

    if (res.statusCode != 200) {
      log("Failed to connect to remote: ${res.statusCode}");
      log("body: ${res.body}");

      _attemptingConnection!.complete();
      return false;
    }

    log("$name validated");

    this.name = name;

    _remoteConn.complete(_RemoteConnection(
      authority: authority,
      httpClient: httpClient,
      gqlLink: Link.from([
        AuthLink(
          getToken: () {
            return "Bearer $jwt";
          },
        ),
        HttpLink(
          Uri.https(authority, "/graphql").toString(),
          httpClient: httpClient,
        ),
      ]),
    ));

    return true;
  }

  Future<String?> getInfo() async {
    final remoteConn = await _remoteConn.future;

    final url = Uri.https(remoteConn.authority, "/info");

    final res = await remoteConn.httpClient.get(url, headers: {
      "Authorization": "Bearer $jwt",
    });

    if (res.statusCode == 200) {
      return res.body;
    }

    return null;
  }
}

class _RemoteConnection {
  final String authority;
  final IOClient httpClient;
  final Link gqlLink;

  _RemoteConnection({
    required this.authority,
    required this.httpClient,
    required this.gqlLink,
  });
}
