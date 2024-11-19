import 'package:flutter/cupertino.dart';
import 'package:todo_clean/features/home/domain/entitites/tasks_entity.dart';
import 'package:todo_clean/features/home/domain/usecases/create_task_use_case.dart';
import 'package:todo_clean/features/home/domain/usecases/delete_task_use_case.dart';
import 'package:todo_clean/features/home/domain/usecases/update_task_use_case.dart';

class HomeVM extends ChangeNotifier {
  CreateTaskUseCase createTaskUseCase;
  UpdateTaskUseCase updateTaskUseCase;
  DeleteTaskUseCase deleteTaskUseCase;

  HomeVM(
      {required this.createTaskUseCase,
      required this.updateTaskUseCase,
      required this.deleteTaskUseCase});

  List<TasksEntity> taskList = [];

  /// CREATE NEW TASK
  bool createTask({required TasksEntity taskEntity}) {
    bool check = false;
    check = createTaskUseCase.call(taskEntity: taskEntity);
    update();
    return check;
  }

  /// UPDATE TASK
  bool updateTask({required String taskId, required bool isCompleted}) {
    bool check = false;
    check = updateTaskUseCase.call(taskId: taskId, isCompleted: isCompleted);
    update();
    return check;
  }

  /// DELETE TASK
  bool deleteTask({required String taskId}) {
    bool check = false;
    check = deleteTaskUseCase.call(taskId: taskId);
    update();
    return check;
  }

  void update() {
    notifyListeners();
  }
}
