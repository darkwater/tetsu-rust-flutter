import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tetsu/cubit/remote_selection_cubit.dart';
import 'package:tetsu/pages/home/home.dart';
import 'package:tetsu/settings.dart';

import 'consts.dart';
import 'remote.dart';
import 'remote_manager.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RemoteAdapter());

  await Hive.openBox<Remote>(BoxNames.remotes);

  runApp(ChangeNotifierProvider(
    create: (context) => RemoteManager(),
    child: BlocProvider(
      create: (context) => RemoteSelectionCubit(),
      child: const MyApp(),
    ),
    lazy: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteSelectionCubit, RemoteSelectionState>(
      builder: (context, state) {
        if (state is! RemoteSelectionSome) {
          return MaterialApp(
            title: "Tetsu",
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.blue,
            ),
            home: const SettingsPage(),
          );
        }

        return MaterialApp(
          title: "Tetsu",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
          ),
          home: Provider<Remote>.value(
            value: state.remote,
            child: const HomePage(),
          ),
        );
      },
    );
  }
}
