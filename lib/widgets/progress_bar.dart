import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progressFraction;
  final Color catColor;

  const ProgressBar(
      {required this.progressFraction, required this.catColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(color: catColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * progressFraction -
                4, // -4 for the border width
            decoration: BoxDecoration(
              color: catColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
