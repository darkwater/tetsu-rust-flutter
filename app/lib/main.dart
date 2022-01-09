import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'consts.dart';
import 'dashboard/dashboard.dart';
import 'remote.dart';
import 'remote_manager.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RemoteAdapter());

  await Hive.openBox<Remote>(BoxNames.remotes);

  runApp(ChangeNotifierProvider(
    create: (context) => RemoteManager(),
    child: const MyApp(),
    lazy: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shino",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const DashboardPage(),
    );
  }
}
