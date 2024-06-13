import 'package:flutter/material.dart';
import 'package:todo/utils.dart';

// ignore: must_be_immutable
class QuestCard extends StatefulWidget {
  final String questName;
  bool isCompleted;
  final Color tintColor;
  Function updateCard;
  final int idx;
  QuestCard(this.questName, this.isCompleted, this.tintColor, this.updateCard,
      this.idx,
      {super.key});

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
        surfaceTintColor: widget.tintColor,
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
                  widget.updateCard(widget.isCompleted, widget.idx);
                },
                child: widget.isCompleted
                    ? Icon(
                        Icons.check_box_rounded,
                        color: themeContext.secondary,
                        size: 30,
                      )
                    : Icon(
                        Icons.check_box_outline_blank_rounded,
                        color: themeContext.secondary,
                        size: 30,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
