import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/Screens/details_screen.dart';
import 'package:todolist/Util/widgets/TaskWidgets.dart';
import 'package:todolist/controller/dashboard_controller.dart';

import '../Util/widgets/card_builder.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({
    super.key,
    required this.username,
    required this.email,
    required this.password,
  });
  final String username;
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome $username👋',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Obx(() => CardBuilder(
                    icon: const Icon(Icons.add_box),
                    text: 'New',
                    count: '${controller.count.value}',
                  )),
              Obx(() => CardBuilder(
                    icon: const Icon(Icons.done_all_sharp),
                    text: 'Completed',
                    count: '${controller.completed.value}',
                  )),
            ],
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.taskList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => TaskDetailsScreen(taskIndex: index));
                      },
                      child: taskWidgets(
                        taskDescription: controller.taskList[index]
                            ['description'],
                        onDelete: (context) => controller.deleteTask(index),
                        taskName: controller.taskList[index]['title'],
                        taskCompleted: controller.taskList[index]['completed'],
                        onChanged: (value) {
                          controller.taskCompleted(value, index);
                        },
                        onEdit: (context) => controller.editTask(index),
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.white,
        ),
        child: Obx(() => BottomNavigationBar(
              currentIndex: controller.selectedTab.value,
              onTap: (index) => controller.changeTab(index),
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: "Start"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month), label: "Project"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.file_copy_outlined), label: "Calendar"),
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.createNewTask,
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
