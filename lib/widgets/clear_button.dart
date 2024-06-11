import 'package:flutter/material.dart';
import 'package:todo/data/user_data.dart';
import 'package:todo/utils.dart';

class ClearButton extends StatelessWidget {
  final int index;

  const ClearButton({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 8,
        right: 8,
        bottom: 8,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeContext.error,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextButton(
          onPressed: () {
            userCategories[index].userTasks.clear();
          },
          child: Text(
            'Clear All Quests',
            style: textStyle(
              20,
              themeContext.onPrimary,
              FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
