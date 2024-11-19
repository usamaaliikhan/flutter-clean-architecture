import 'package:todo_clean/features/home/domain/entitites/tasks_entity.dart';

abstract class HomeRepository {
  bool createTask({required TasksEntity taskEntity});
  bool updateTask({required String taskId, required bool isCompleted});
  bool deleteTask({required String taskId});
}
