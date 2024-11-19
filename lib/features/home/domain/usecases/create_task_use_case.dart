import 'package:todo_clean/features/home/domain/entitites/tasks_entity.dart';
import 'package:todo_clean/features/home/domain/repository/home_repository.dart';

class CreateTaskUseCase {
  final HomeRepository repository;

  CreateTaskUseCase({required this.repository});

  bool call({required TasksEntity taskEntity}) {
    return repository.createTask(taskEntity: taskEntity);
  }
}
