import 'package:todo_clean/features/home/domain/repository/home_repository.dart';

class DeleteTaskUseCase {
  final HomeRepository repository;

  DeleteTaskUseCase({required this.repository});

  bool call({required String taskId}) {
    return repository.deleteTask(taskId: taskId);
  }
}
