import 'package:hive/hive.dart';

part '../adapters/task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(2)
  bool isDone = false;

  Task({
    required this.name,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
