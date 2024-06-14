import 'package:flutter/material.dart';
import 'package:todo/data/user_data.dart';
import 'package:todo/models/category.dart';
import 'package:todo/utils.dart';
import 'package:todo/widgets/clear_button.dart';
import 'package:todo/widgets/progress_bar.dart';
import 'package:todo/widgets/quest_card.dart';

// ignore: must_be_immutable
class CategoryDetails extends StatefulWidget {
  final Category category;
  final int idx;
  int numCompletedTasks;
  final Function writeData;

  CategoryDetails(
      {required this.category,
      required this.idx,
      required this.numCompletedTasks,
      required this.writeData,
      super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  clearAllTasks() {
    setState(() {
      userCategories[widget.idx].userTasks.clear();
    });
    widget.writeData();
  }

  updateCard(bool isDone, int idx) {
    if (isDone) {
      setState(() {
        widget.numCompletedTasks--;
        userCategories[widget.idx].userTasks[idx].isDone = false;
      });
    } else {
      setState(() {
        widget.numCompletedTasks++;
        userCategories[widget.idx].userTasks[idx].isDone = true;
      });
    }
    widget.writeData();
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context).colorScheme;

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: themeContext.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      widget.category.icon,
                      color: widget.category.color,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.category.name,
                      style:
                          textStyle(24, themeContext.primary, FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      userCategories[widget.idx].tasksRatio().isNaN
                          ? '0/0'
                          : '${widget.numCompletedTasks}/${userCategories[widget.idx].userTasks.length}',
                      style:
                          textStyle(24, themeContext.primary, FontWeight.w500),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            ProgressBar(
              progressFraction: userCategories[widget.idx].tasksRatio().isNaN ||
                      userCategories[widget.idx].tasksRatio() /
                              userCategories[widget.idx].userTasks.length ==
                          0
                  ? 0.05
                  : userCategories[widget.idx].tasksRatio(),
              catColor: widget.category.color,
            ),
            const SizedBox(height: 10),
            widget.category.userTasks.isEmpty
                ? Text(
                    'No tasks yet',
                    style: textStyle(24, themeContext.primary, FontWeight.w500),
                  ) // Edit
                : Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.category.userTasks.length,
                        itemBuilder: (context, index) {
                          final task = widget.category.userTasks[index];
                          return Column(
                            children: [
                              const SizedBox(height: 10),
                              Dismissible(
                                onDismissed: (direction) {
                                  setState(() {
                                    if (userCategories[widget.idx]
                                        .userTasks[index]
                                        .isDone) {
                                      widget.numCompletedTasks--;
                                    }
                                    userCategories[widget.idx].removeTask(task);
                                    widget.writeData();
                                  });
                                },
                                key: UniqueKey(),
                                child: QuestCard(
                                  task.name,
                                  task.isDone,
                                  widget.category.color,
                                  updateCard,
                                  index,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      ClearButton(
                        index: widget.idx,
                        onPressed: clearAllTasks,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
