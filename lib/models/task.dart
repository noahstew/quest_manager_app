import "package:todo/models/category.dart";

class Task {
  String name;
  Category category;
  bool isDone;

  Task({required this.name, required this.category, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
