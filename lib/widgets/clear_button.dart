import 'package:flutter/material.dart';
import 'package:todo/utils.dart';

class ClearButton extends StatelessWidget {
  final Function() onPressed;
  final int index;

  const ClearButton({required this.index, required this.onPressed, super.key});

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
          onPressed: onPressed,
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
