// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:todo_clean/features/global/const/enums.dart';

class TasksEntity extends Equatable {
  final String? title;
  final String? id;
  final String? description;
  bool? isCompleted;
  final TaskPriorityType? taskPriorityType;

  @override
  List<Object?> get props => [title, description];

  TasksEntity(
      {this.title,
      this.description,
      this.isCompleted,
      this.taskPriorityType,
      this.id});
}
