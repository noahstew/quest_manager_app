import "package:todo/models/category.dart";

class Task {
  String name;
  Category category;
  bool isDone = false;

  Task({required this.name, required this.category});

  void toggleDone() {
    isDone = !isDone;
  }
}
