import 'package:todo_clean/features/home/data/data_sources/home_data_source.dart';
import 'package:todo_clean/features/home/domain/entitites/tasks_entity.dart';
import 'package:todo_clean/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;
  HomeRepositoryImpl({required this.homeDataSource});

  @override
  bool createTask({required TasksEntity taskEntity}) {
    return homeDataSource.createTask(taskEntity: taskEntity);
  }

  @override
  bool updateTask({required String taskId, required bool isCompleted}) {
    return homeDataSource.updateTask(taskId: taskId, isCompleted: isCompleted);
  }

  @override
  bool deleteTask({required String taskId}) {
    return homeDataSource.deleteTask(taskId: taskId);
  }
}
