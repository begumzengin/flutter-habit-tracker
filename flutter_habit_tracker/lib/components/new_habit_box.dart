import 'package:flutter/material.dart';
import 'package:flutter_habit_tracker/constants.dart';

class EnterNewHabitBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const EnterNewHabitBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: const TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
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
