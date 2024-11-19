import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_clean/features/home/data/data_sources/home_data_source_impl.dart';
import 'package:todo_clean/features/home/data/repository/home_repository_impl.dart';
import 'package:todo_clean/features/home/domain/usecases/create_task_use_case.dart';
import 'package:todo_clean/features/home/domain/usecases/delete_task_use_case.dart';
import 'package:todo_clean/features/home/domain/usecases/update_task_use_case.dart';
import 'package:todo_clean/features/home/presentation/provider/home_vm.dart';

class Injector extends StatelessWidget {
  final Widget routerWidget;

  Injector({super.key, required this.routerWidget});

  final CreateTaskUseCase createTaskUseCase = CreateTaskUseCase(
      repository: HomeRepositoryImpl(homeDataSource: HomeDataSourceImpl()));

  final UpdateTaskUseCase updateTaskUseCase = UpdateTaskUseCase(
      repository: HomeRepositoryImpl(homeDataSource: HomeDataSourceImpl()));

  final DeleteTaskUseCase deleteTaskUseCase = DeleteTaskUseCase(
      repository: HomeRepositoryImpl(homeDataSource: HomeDataSourceImpl()));

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return HomeVM(
            createTaskUseCase: createTaskUseCase,
            updateTaskUseCase: updateTaskUseCase,
            deleteTaskUseCase: deleteTaskUseCase,
          );
        }),
      ],
      child: routerWidget,
    );
  }
}
