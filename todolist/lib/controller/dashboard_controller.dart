import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/Util/formatter/formatter.dart';
import 'package:todolist/Util/widgets/dialog_widget.dart';

class DashboardController extends GetxController {
  var count = 0.obs;
  var completed = 0.obs;
  var selectedTab = 0.obs;
  final taskController = TextEditingController();
  final descriptionController = TextEditingController();
  var taskList = <Map<String, dynamic>>[].obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void deleteTask(int index) {
    if (taskList[index]['completed']) {
      completed--;
    }
    taskList.removeAt(index);
    count--;
  }

  void taskCompleted(bool? value, int index) {
    taskList[index]['completed'] = value!;
    taskList[index] = taskList[index];
    if (value) {
      completed++;
    } else {
      completed--;
    }
  }

  void saveTask() {
    DateTime now = DateTime.now();
    taskList.add({
      'title': taskController.text,
      'description': descriptionController.text,
      'completed': false,
      'date': AppFormatter.formatDate(now)
    });
    count++;
    taskController.clear();
    descriptionController.clear();
    Get.back();
  }

  void editTask(int index) {
    taskController.text = taskList[index]['title'];
    descriptionController.text = taskList[index]['description'];
    Get.dialog(
      DialogWidget(
        descriptionEditingController: descriptionController,
        textEditingController: taskController,
        onSave: () {
          taskList[index]['title'] = taskController.text;
          taskList[index]['description'] = descriptionController.text;
          taskList.refresh();
          taskController.clear();
          descriptionController.clear();
          Get.back();
        },
        onCancel: () {
          taskController.clear();
          descriptionController.clear();
          Get.back();
        },
      ),
    );
  }

  void createNewTask() {
    Get.dialog(
      DialogWidget(
        descriptionEditingController: descriptionController,
        textEditingController: taskController,
        onSave: saveTask,
        onCancel: () {
          taskController.clear();
          descriptionController.clear();
          Get.back();
        },
      ),
    );
  }
}
