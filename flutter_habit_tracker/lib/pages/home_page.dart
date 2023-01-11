import 'package:flutter/material.dart';
import 'package:flutter_habit_tracker/components/habit_tile.dart';
import '../components/my_fab.dart';
import '../components/new_habit_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //data structure for todays list
  List todaysHabitList = [
    // [ habitName, habitCompleted]
    ["morning run", false],
    ["read book", false],
  ];

  //checkbox was tapped
  void checkboxTapped(bool? value, int index) {
    setState(() {
      todaysHabitList[index][1] = value;
    });
  }

  //create a new habit
  void createNewHabit() {
    // show alert dialog for user to enter the new habit details
    showDialog(
        context: context,
        builder: (context) {
          return EnterNewHabitBox();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(
        onPressed: () => createNewHabit(),
      ),
      body: ListView.builder(
          itemCount: todaysHabitList.length,
          itemBuilder: (context, index) {
            return HabitTile(
              habitName: todaysHabitList[index][0],
              habitCompleted: todaysHabitList[index][1],
              onChanged: (value) => checkboxTapped(value, index),
            );
          }),
    );
  }
}
