import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/Util/constants/images.dart';
import 'package:todolist/Util/app_butttons/app_button_widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset(
            AppImages.welcomeLogo,
            height: 300,
          ),
          const SizedBox(height: 30),
          const Text.rich(
            TextSpan(children: <TextSpan>[
              TextSpan(
                text: 'Welcome to ',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'Taskaholic',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
          const Text(
            'Get ready to conquer your to-do list',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const Text('Manage all your projects and tasks in one place.'),
          const SizedBox(height: 100),
          buildButton(
            border: BorderSide.none,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            text: "Get Started",
            onPressed: () {
              Get.toNamed('/register');
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Do you have an account?',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(width: 1),
              TextButton(onPressed: () {}, child: const Text('Login')),
            ],
          ),
        ],
      ),
    );
  }
}
