import 'package:hive/hive.dart';
import 'category.dart';

part '../adapters/task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  Category category;

  @HiveField(2)
  bool isDone = false;

  Task({required this.name, required this.category});

  void toggleDone() {
    isDone = !isDone;
  }
}
