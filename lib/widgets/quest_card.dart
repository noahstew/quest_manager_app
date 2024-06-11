import 'package:flutter/material.dart';
import 'package:todo/utils.dart';

// ignore: must_be_immutable
class QuestCard extends StatefulWidget {
  final String questName;
  bool isCompleted;
  QuestCard(this.questName, this.isCompleted, {super.key});

  @override
  State<QuestCard> createState() => _QuestCardState();
}

class _QuestCardState extends State<QuestCard> {
  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context).colorScheme;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Card(
        color: themeContext.primaryContainer,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.questName,
                style: textStyle(20, themeContext.primary, FontWeight.w500),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.isCompleted = !widget.isCompleted;
                  });
                },
                child: widget.isCompleted
                    ? Icon(Icons.check_box_rounded,
                        color: themeContext.secondary, size: 30)
                    : Icon(Icons.check_box_outline_blank_rounded,
                        color: themeContext.secondary, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
