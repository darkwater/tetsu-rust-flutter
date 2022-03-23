import 'dart:math';

import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tetsu/consts.dart';

import 'remote.dart';

class RemoteManager extends ChangeNotifier {
  final BonsoirDiscovery discovery = BonsoirDiscovery(type: "_tetsu._tcp");
  final List<ResolvedBonsoirService> discoveredServices = [];
  final Map<int, Remote> remotes = {};

  RemoteManager() {
    // TODO: try multicast_dns instead

    loadAll();

    discovery.ready.then((_) async {
      await discovery.start();

      discovery.eventStream!.listen((event) {
        if (event.service == null || !event.isServiceResolved) {
          return;
        }

        final service = event.service!;

        if (event.type ==
                BonsoirDiscoveryEventType.DISCOVERY_SERVICE_RESOLVED &&
            (service.attributes?.containsKey("fingerprint") ?? false) &&
            !discoveredServices.contains(service)) {
          discoveredServices.add(service as ResolvedBonsoirService);

          final fingerprint = service.attributes!["fingerprint"];
          final host = service.name.split(" ").first + ".local";

          for (final remote
              in remotes.values.where((r) => r.fingerprint == fingerprint)) {
            remote.connect(service.name, host, service.port);
          }

          notifyListeners();
        }

        if (event.type == BonsoirDiscoveryEventType.DISCOVERY_SERVICE_LOST) {
          discoveredServices.remove(service);
          notifyListeners();
        }
      });
    });
  }

  Future<Remote?> addRemote(String fingerprint, String jwt) async {
    final id = Random().nextInt(1 << 32);
    remotes[id] = Remote(id, fingerprint, jwt);
    notifyListeners();

    final services = discoveredServices.where(
      (service) => service.attributes!["fingerprint"] == fingerprint,
    );

    saveAll();

    for (final service in services) {
      final host = service.name.split(" ").first + ".local";

      if (await remotes[id]!.connect(service.name, host, service.port)) {
        break;
      }
    }

    return remotes[id];
  }

  void saveAll() {
    final box = Hive.box<Remote>(BoxNames.remotes);
    box.clear();

    remotes.forEach((id, remote) {
      box.put(id, remote);
    });
  }

  void loadAll() {
    final box = Hive.box<Remote>(BoxNames.remotes);

    for (final remote in box.values) {
      remotes[remote.id] = remote;
    }

    notifyListeners();
  }
}
