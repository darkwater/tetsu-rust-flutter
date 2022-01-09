import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'addremote.dart';
import 'remote.dart';
import 'remote_manager.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const SettingsPage(),
    );
  }

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(
            width: 500,
          ),
          child: Material(
            elevation: 6,
            color: Theme.of(context).cardColor,
            child: ListView(
              children: [
                const ListTile(
                  title: Text("Remotes"),
                ),
                Selector<RemoteManager, List<Remote>>(
                  selector: (context, remoteConnector) =>
                      remoteConnector.remotes.values.toList(),
                  builder: (context, services, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        final remote = services[index];

                        return ListTile(
                          title: Text(remote.name),
                          subtitle: Text(remote.fingerprint),
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  title: const Text("Add remote"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => Navigator.push(context, AddRemotePage.route()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
