import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

class Category {
  static int idCounter = 0;
  String id = '';
  final String name;
  final IconData icon;
  final Color color;
  bool isExpanded = false;
  List<Task> userTasks = [];

  Category({
    required this.name,
    required this.icon,
    required this.color,
  }) {
    id = '${++idCounter}';
  }

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
