import 'package:flutter/material.dart';

class PlayerPopupButton extends StatelessWidget {
  const PlayerPopupButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              alignment: AlignmentDirectional.bottomEnd,
            );
          },
          barrierColor: Colors.black38,
        );
      },
      child: const Icon(
        Icons.settings_remote,
        color: Colors.white,
      ),
    );
  }
}
