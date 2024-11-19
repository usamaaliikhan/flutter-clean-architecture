import 'package:todo_clean/features/home/domain/entitites/tasks_entity.dart';

class TaskModel extends TasksEntity {
  TaskModel({
    super.title,
    super.description,
    super.taskPriorityType,
    super.isCompleted,
    super.id,
  });
}
