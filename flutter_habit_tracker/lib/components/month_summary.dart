import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_habit_tracker/datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
        startDate: createDateTimeObject(startDate),
        endDate: DateTime.now().add(Duration(days: 0)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[200],
        textColor: Colors.white,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 30,
        colorsets: const {
          1: Color.fromARGB(19, 252, 136, 98),
          2: Color.fromARGB(40, 252, 136, 98),
          3: Color.fromARGB(59, 252, 136, 98),
          4: Color.fromARGB(80, 252, 136, 98),
          5: Color.fromARGB(99, 252, 136, 98),
          6: Color.fromARGB(120, 252, 136, 98),
          7: Color.fromARGB(149, 252, 136, 98),
          8: Color.fromARGB(180, 252, 136, 98),
          9: Color.fromARGB(220, 252, 136, 98),
          10: Color.fromARGB(225, 252, 136, 98),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
