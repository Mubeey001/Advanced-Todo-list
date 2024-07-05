import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/Screens/dashboard_screen.dart';
import 'package:todolist/Screens/registration_screen.dart';
import 'package:todolist/Screens/welcome_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/welco',
      getPages: [
        GetPage(name: '/', page: () => const WelcomePage()),
        GetPage(name: '/register', page: () => const Register()),
        GetPage(
          name: '/dashboard',
          page: () {
            final args = Get.arguments as Map<String, String>;
            return DashBoard(
              username: args['username']!,
              email: args['email']!,
              password: args['password']!,
            );
          },
        ),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Todo list',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF5F5F5)),
        useMaterial3: true,
      ),
    );
  }
}
