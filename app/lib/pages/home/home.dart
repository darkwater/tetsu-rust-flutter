import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tetsu/cubit/remote_selection_cubit.dart';
import 'package:tetsu/remote.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Consumer<Remote>(builder: (context, remote, child) {
            return IconButton(
              icon: const Icon(Icons.cast_connected),
              onPressed: () {
                context.read<RemoteSelectionCubit>().unselect();
              },
              tooltip: "Connected to ${remote.name}",
            );
          }),
        ],
      ),
      body: const Center(
        child: Text("Hello World"),
      ),
    );
  }
}
