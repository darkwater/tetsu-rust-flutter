import 'package:flutter/material.dart';

class PlayerDrawerButton extends StatefulWidget {
  const PlayerDrawerButton({
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerDrawerButton> createState() => _PlayerDrawerButtonState();
}

class _PlayerDrawerButtonState extends State<PlayerDrawerButton> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
      child: const Icon(
        Icons.settings_remote,
        color: Colors.white,
      ),
    );
  }
}
