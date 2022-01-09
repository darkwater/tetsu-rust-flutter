import 'dart:convert';
import 'dart:io';

import 'package:bonsoir/bonsoir.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/io_client.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shino/remote_manager.dart';

class AddRemotePage extends StatefulWidget {
  const AddRemotePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const AddRemotePage(),
    );
  }

  @override
  _AddRemotePageState createState() => _AddRemotePageState();
}

class _AddRemotePageState extends State<AddRemotePage> {
  Key? qrkey;
  String scannedCode = "";
  bool connecting = false;

  @override
  void initState() {
    super.initState();

    qrkey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: qrkey!,
            onQRViewCreated: (controller) {
              controller.scannedDataStream.listen((barcode) async {
                if (barcode.code == null || barcode.code == scannedCode) return;
                setState(() {
                  scannedCode = barcode.code!;
                  connecting = true;
                });

                HapticFeedback.vibrate();

                final payload = jsonDecode(scannedCode);
                final fingerprint = payload["fingerprint"];
                final jwt = payload["jwt"];

                await Future.delayed(const Duration(milliseconds: 1500));

                final remoteConnector = context.read<RemoteManager>();
                final remote =
                    await remoteConnector.addRemote(fingerprint, jwt);

                if (remote != null) {
                  final info = await remote.getInfo();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(info ?? "failed to get info"),
                      duration: const Duration(seconds: 2),
                    ),
                  );

                  Navigator.of(context).pop();
                } else {
                  setState(() => connecting = false);
                }
              });
            },
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            height: 100,
            child: Container(
              color: Colors.blueGrey[900],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  scannedCode,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Menlo",
                  ),
                ),
              ),
            ),
          ),
          if (connecting)
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
