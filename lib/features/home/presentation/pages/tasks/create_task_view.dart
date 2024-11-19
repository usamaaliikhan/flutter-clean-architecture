import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_clean/features/global/common/app_button.dart';
import 'package:todo_clean/features/global/const/enums.dart';
import 'package:todo_clean/features/global/resources/resources.dart';
import 'package:todo_clean/features/home/domain/entitites/tasks_entity.dart';
import 'package:todo_clean/features/home/presentation/provider/home_vm.dart';

class CreateTaskView extends StatefulWidget {
  static String route = "/CreateTasks";
  const CreateTaskView({super.key});

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  FocusNode titleFN = FocusNode();
  FocusNode descriptionFN = FocusNode();
  bool isAlertEnabled = false;
  TaskPriorityType priorityType = TaskPriorityType.high;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.primaryColor,
      appBar: AppBar(
        backgroundColor: R.colors.primaryColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: R.colors.white,
            )),
        title: Text(
          "Create Task",
          style: TextStyle(color: R.colors.white),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          children: [
            titleField(),
            SizedBox(
              height: 2.h,
            ),
            descriptionField(),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Expanded(child: taskTypeWidget(TaskPriorityType.high)),
                Expanded(child: taskTypeWidget(TaskPriorityType.medium)),
                Expanded(child: taskTypeWidget(TaskPriorityType.low)),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: AppButton(
          buttonTitle: 'Create Task',
          onTap: () {
            if (formKey.currentState!.validate()) {
              TasksEntity tasksEntity = TasksEntity(
                  title: titleController.text.trim(),
                  description: descriptionController.text.trim(),
                  isCompleted: false,
                  id: generateRandomId(),
                  taskPriorityType: priorityType);
              bool check =
                  context.read<HomeVM>().createTask(taskEntity: tasksEntity);
              if (check) {
                Get.back();
              }
            }
          },
        ),
      ),
    );
  }

  Widget titleField() {
    return TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(30)],
      style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 14.sp, color: R.colors.white),
      controller: titleController,
      focusNode: titleFN,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Please enter title";
        }
        return null;
      },
      decoration: R.inputDecoration.fieldDecoration(
        hintText: 'Title',
      ),
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(descriptionFN);
        setState(() {});
      },
      onTap: () {
        setState(() {});
      },
    );
  }

  Widget descriptionField() {
    return TextFormField(
      style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 14.sp, color: R.colors.white),
      controller: descriptionController,
      focusNode: descriptionFN,
      minLines: 4,
      maxLines: 6,
      keyboardType: TextInputType.multiline,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Please enter description";
        }
        return null;
      },
      decoration: R.inputDecoration.fieldDecoration(
        hintText: 'Description',
      ),
      onFieldSubmitted: (value) {
        FocusScope.of(context).unfocus();
        setState(() {});
      },
      onTap: () {
        setState(() {});
      },
    );
  }

  Widget taskTypeWidget(TaskPriorityType type) {
    return GestureDetector(
      onTap: () {
        setState(() {
          priorityType = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: priorityType == type
                ? R.colors.secondaryColor
                : R.colors.primaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: priorityType == type
                    ? R.colors.secondaryColor
                    : R.colors.white)),
        child: Center(
          child: Text(
            type.name.capitalizeFirst ?? "",
            style: TextStyle(
                color: priorityType == type
                    ? R.colors.primaryColor
                    : R.colors.white,
                fontSize: 14.sp,
                fontWeight:
                    priorityType == type ? FontWeight.bold : FontWeight.w500),
          ),
        ),
      ),
    );
  }

  /// GENERATE RANDOM ID
  String generateRandomId() {
    Random random = Random();
    int randomNumber = random.nextInt(900000) + 100000;
    return randomNumber.toString();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    descriptionFN.dispose();
  }
}
