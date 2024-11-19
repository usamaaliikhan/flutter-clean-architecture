import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todo_clean/features/home/data/data_sources/home_data_source.dart';
import 'package:todo_clean/features/home/domain/entitites/tasks_entity.dart';
import 'package:todo_clean/features/home/presentation/provider/home_vm.dart';

class HomeDataSourceImpl implements HomeDataSource {
  @override
  bool createTask({required TasksEntity taskEntity}) {
    var vm = Get.context!.read<HomeVM>();
    vm.taskList.add(taskEntity);
    vm.update();
    return true;
  }

  @override
  bool updateTask({required String taskId, required bool isCompleted}) {
    var vm = Get.context!.read<HomeVM>();
    int index = vm.taskList.indexWhere((element) => element.id == taskId);
    if (index != -1) {
      vm.taskList[index].isCompleted = isCompleted;
      return isCompleted;
    }
    vm.update();
    return false;
  }

  @override
  bool deleteTask({required String taskId}) {
    var vm = Get.context!.read<HomeVM>();
    int index = vm.taskList.indexWhere((element) => element.id == taskId);
    if (index != -1) {
      vm.taskList.removeAt(index);
      return true;
    }
    vm.update();
    return false;
  }
}
