import 'package:flutter/material.dart';
import 'package:todo/data/user_data.dart';
import 'package:todo/models/category.dart';
import 'package:todo/utils.dart';
import 'package:todo/widgets/progress_bar.dart';

class CategoryOverview extends StatefulWidget {
  final Category category;
  final int idx;

  const CategoryOverview(
      {required this.category, required this.idx, super.key});

  @override
  State<CategoryOverview> createState() => _CategoryOverviewState();
}

class _CategoryOverviewState extends State<CategoryOverview> {
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
                          : '${userCategories[widget.idx].tasksRatio().toInt()}/${userCategories[widget.idx].userTasks.length}',
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
              catColor: widget.category.color!,
            ),
          ],
        ),
      ),
    );
  }
}
