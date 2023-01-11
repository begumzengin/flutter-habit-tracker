import 'package:flutter_habit_tracker/datetime/date_time.dart';
import 'package:hive_flutter/hive_flutter.dart';

//reference our box
final _myBox = Hive.box("habit_database");

class HabitDatabase {
  List todaysHabitList = [];

  //create initial default data
  void createDefaultData() {
    todaysHabitList = [
      // [ habitName, habitCompleted]
      ["morning run", false],
      ["read book", false],
    ];

    _myBox.put("START_DATE", todaysDateFormatted());
  }

  //load data if it already exists
  void loadData() {
    //if it's a new day, get habit list from database
    if (_myBox.get(todaysDateFormatted()) == null) {
      todaysHabitList = _myBox.get("CURRENT_HABIT_LIST");
      //set all habit completed to false since its a new day
      for (int i = 0; i < todaysHabitList.length; i++) {
        todaysHabitList[i][i] = false;
      }
    }
    //if it's not a new day, load todays list
    else {
      todaysHabitList = _myBox.get(todaysDateFormatted());
    }
  }

  //update database
  void updateDatabase() {
    //update todays entry
    _myBox.put(todaysDateFormatted(), todaysHabitList);

    //update universal habit list in case it changed
    //(new habit, edit habit, delete habit)
    _myBox.put("CURRENT_HABIT_LIST", todaysHabitList);

    //calculate habit complete percentages for each day
    calculateHabitPercentages();

    //load heat map
    loadHeatMap();
  }

  void calculateHabitPercentage() {
    int countCompleted = 0;
    for (int i = 0; i < todaysHabitList.length; i++) {
      if (todaysHabitList[i][1] == true) {
        countCompleted++;
      }
    }

    String percent = todaysHabitList.isEmpty
        ? '0.0'
        : (countCompleted / todaysHabitList.length).toStringAsFixed(1);
  }

  void loadHeatMap() {}
}
