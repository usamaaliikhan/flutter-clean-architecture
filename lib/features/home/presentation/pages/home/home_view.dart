import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_clean/features/global/resources/resources.dart';
import 'package:todo_clean/features/home/domain/entitites/tasks_entity.dart';
import 'package:todo_clean/features/home/presentation/pages/tasks/create_task_view.dart';
import 'package:todo_clean/features/home/presentation/provider/home_vm.dart';

class HomeView extends StatefulWidget {
  static String route = "/HomeView";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(builder: (context, vm, _) {
      return Scaffold(
        backgroundColor: R.colors.primaryColor,
        appBar: AppBar(
          backgroundColor: R.colors.primaryColor,
          title: Text(
            "Your Tasks",
            style: TextStyle(color: R.colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                width: Get.width,
                decoration: BoxDecoration(
                    color: R.colors.textColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Tasks",
                          style:
                              TextStyle(fontSize: 14.sp, color: R.colors.white),
                        ),
                        Text(
                          "${vm.taskList.where(
                                (element) => element.isCompleted == true,
                              ).length}/${vm.taskList.length}",
                          style: TextStyle(
                              fontSize: 14.sp, color: R.colors.secondaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.incomplete_circle,
                          color: R.colors.white,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: Container(
                            height: 1.3.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: R.colors.hintColor, width: 0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: LinearProgressIndicator(
                              value:
                                  calculateCompletionPercentage(vm.taskList) /
                                      100,
                              backgroundColor: R.colors.white,
                              borderRadius: BorderRadius.circular(5),
                              color: R.colors.secondaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "${calculateCompletionPercentage(vm.taskList).toStringAsFixed(1)}%",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: R.colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Expanded(
                  child: vm.taskList.isEmpty
                      ? Center(
                          child: Text(
                            "No Tasks Added Yet",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: R.colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      : SlidableAutoCloseBehavior(
                          child: ListView(
                            shrinkWrap: true,
                            children: List.generate(
                              vm.taskList.length,
                              (index) => tasksWidget(vm.taskList[index], vm),
                            ),
                          ),
                        ))
            ],
          ),
        ),
        floatingActionButton: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: FloatingActionButton(
              backgroundColor: R.colors.secondaryColor,
              child: Icon(
                Icons.add,
                size: 25,
              ),
              onPressed: () {
                Get.toNamed(CreateTaskView.route);
              },
            )),
      );
    });
  }

  double calculateCompletionPercentage(List<TasksEntity> items) {
    if (items.isEmpty) {
      return 100; // Return 0% if the list is empty
    }
    // Count the total number of items
    int totalItems = items.length;
    // Count the number of completed items
    int completedItems = items.where((item) => item.isCompleted == true).length;
    // Calculate the percentage of completed items
    double completionPercentage = (completedItems / totalItems) * 100;
    return completionPercentage;
  }

  Widget tasksWidget(TasksEntity task, HomeVM vm) {
    return Slidable(
      key: ValueKey(task.id ?? ""),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: .16,
        children: [
          CustomSlidableAction(
            padding: EdgeInsets.zero,
            foregroundColor: R.colors.darkRed,
            borderRadius: BorderRadius.circular(8),
            onPressed: (context) {
              bool check = vm.deleteTask(taskId: task.id ?? "");
              if (check) {
                vm.taskList.remove(task);
                vm.update();
                setState(() {});
              }
            },
            backgroundColor: R.colors.darkRed,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: R.colors.darkRed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.delete_outlined,
                  color: R.colors.white,
                )),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          task.isCompleted = vm.updateTask(
              taskId: task.id ?? "", isCompleted: !(task.isCompleted ?? false));
          setState(() {});
          vm.update();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          margin: const EdgeInsets.symmetric(vertical: 5),
          width: Get.width,
          decoration: BoxDecoration(
              color: R.colors.textColor,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title ?? "",
                        style: TextStyle(
                            color: R.colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        task.description ?? "",
                        style: TextStyle(
                            color: R.colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        task.taskPriorityType?.name.capitalizeFirst ?? "",
                        style: TextStyle(
                            color: R.colors.secondaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        height: 17.sp,
                        width: 17.sp,
                        decoration: BoxDecoration(
                            color: task.isCompleted == true
                                ? R.colors.secondaryColor
                                : R.colors.textColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1, color: R.colors.secondaryColor)),
                        child: Center(
                            child: Icon(
                          Icons.check,
                          size: 12,
                          color: task.isCompleted == true
                              ? R.colors.primaryColor
                              : R.colors.transparent,
                        )),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
