import 'package:flutter/material.dart';
import 'package:todolist/Util/TaskWidgets.dart';
import 'package:todolist/Util/dialog_widget.dart';
import 'package:todolist/components/component.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key, required this.username});
  final String username;

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int count = 0;
  int completed = 0;
  int _selectedTab = 0;
  final _controller = TextEditingController();

  List taskList = [];

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  void taskCompleted(bool? value, int index) {
    setState(() {
      taskList[index][1] = value!;
      if (value) {
        completed++;
      } else {
        completed--;
      }
    });
  }

  void saveTask() {
    setState(() {
      taskList.add([_controller.text, false]);
      count++; // Increment the count
      _controller.clear();
    });
    Navigator.pop(context);
  }

  void editTask(int index) {
    _controller.text =
        taskList[index][0]; // Set the current task name to the controller
    showDialog(
        context: context,
        builder: (context) {
          return DialogWidget(
            textEditingController: _controller,
            onSave: () {
              setState(() {
                taskList[index][0] = _controller.text;
                _controller.clear();
              });
              Navigator.pop(context);
            },
            onCancel: () {
              _controller.clear();
              Navigator.pop(context);
            },
          );
        });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogWidget(
            textEditingController: _controller,
            onSave: saveTask,
            onCancel: () {
              Navigator.pop(context);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF5F5F5),
        title: Text(
          'Welcome ${widget.username}👋',
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
              CardBuilder(
                icon: const Icon(Icons.add_box),
                text: 'New',
                count: '$count',
              ),
              CardBuilder(
                icon: const Icon(Icons.done_all_sharp),
                text: 'Completed',
                count: '$completed',
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return taskWidgets(
                  onDelete: (value) => deleteTask(index),
                  taskName: taskList[index][0],
                  taskCompleted: taskList[index][1],
                  onChanged: (value) {
                    taskCompleted(value, index);
                  },
                  onEdit: (value) => editTask(index), // Pass the edit function
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
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
