import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean/features/home/presentation/pages/home/home_view.dart';
import 'package:todo_clean/features/home/presentation/pages/tasks/create_task_view.dart';

abstract class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
        name: HomeView.route,
        page: () => const HomeView(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 1000)),
    GetPage(
        name: CreateTaskView.route,
        page: () => const CreateTaskView(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 1000)),
  ];
}
