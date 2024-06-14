import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'task.dart';

part '../adapters/category.g.dart';

@HiveType(typeId: 0)
class Category extends HiveObject {
  static int idCounter = 0;

  @HiveField(0)
  String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final IconData icon;

  @HiveField(3)
  final Color color;

  @HiveField(4)
  bool isExpanded = false;

  @HiveField(5)
  List<Task> userTasks = [];

  Category({
    required this.name,
    required this.icon,
    required this.color,
  }) : id = '${++idCounter}';

  void addTask(Task task) {
    userTasks.add(task);
  }

  void removeTask(Task task) {
    userTasks.remove(task);
  }

  double tasksRatio() {
    int completedTasks = 0;

    for (Task task in userTasks) {
      if (task.isDone) {
        completedTasks++;
      }
    }
    return completedTasks / userTasks.length;
  }
}
