import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/dashboard_controller.dart';

import '../Util/widgets/detailScreen_Widgets/details_screen_widgets.dart';

class TaskDetailsScreen extends StatelessWidget {
  final int taskIndex;

  const TaskDetailsScreen({super.key, required this.taskIndex});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Task Details')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDetailRow(
              'Task Title:',
              controller.taskList[taskIndex]['title'],
            ),
            const SizedBox(height: 16),
            buildDetailRow(
              'Task Description:',
              controller.taskList[taskIndex]['description'],
            ),
            const SizedBox(height: 16),
            buildDetailRow(
              'Date of Task Creation:',
              controller.taskList[taskIndex]['date'],
            ),
            const SizedBox(height: 16),
            buildStatusRow(
              controller.taskList[taskIndex]['completed'],
            ),
          ],
        ),
      ),
    );
  }
}
