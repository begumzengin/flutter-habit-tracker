import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTile({
    super.key,
    required this.habitName,
    required this.habitCompleted,
    required this.onChanged,
    required this.settingsTapped,
    required this.deleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            //settings option
            SlidableAction(
              onPressed: settingsTapped,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(12),
            ),

            //delete option
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Color(0xFFEB6859),
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: habitCompleted,
                onChanged: onChanged,
                activeColor: Color(0xFF5D7B6F),
              ),
              //habit name
              Text(habitName, style: GoogleFonts.spaceGrotesk()),
            ],
          ),
        ),
      ),
    );
  }
}
