import 'package:flutter/material.dart';
import 'package:flutter_habit_tracker/components/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bool to control habit completed
  bool habitCompleted = false;

  //checkbox was tapped
  void checkboxTapped(bool? value) {
    setState(() {
      habitCompleted = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          //habit tiles
          HabitTile(
            habitName: "morning run",
            habitCompleted: habitCompleted,
            onChanged: (value) => checkboxTapped(value),
          ),
        ],
      ),
    );
  }
}
