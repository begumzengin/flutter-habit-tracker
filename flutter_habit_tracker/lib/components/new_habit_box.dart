import 'package:flutter/material.dart';
import 'package:flutter_habit_tracker/constants.dart';

class EnterNewHabitBox extends StatelessWidget {
  const EnterNewHabitBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(),
      actions: [
        MaterialButton(
          onPressed: () {},
          child: Text(
            "save",
            style: TextStyle(color: Colors.white),
          ),
          color: strikemaster,
        ),
        MaterialButton(
          onPressed: () {},
          child: Text(
            "cancel",
            style: TextStyle(color: Colors.white),
          ),
          color: strikemaster,
        )
      ],
    );
  }
}
