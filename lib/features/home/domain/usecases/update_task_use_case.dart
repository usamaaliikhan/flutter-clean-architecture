import 'package:todo_clean/features/home/domain/repository/home_repository.dart';

class UpdateTaskUseCase {
  final HomeRepository repository;

  UpdateTaskUseCase({required this.repository});

  bool call({required String taskId, required bool isCompleted}) {
    return repository.updateTask(taskId: taskId, isCompleted: isCompleted);
  }
}
