import 'package:flutter/material.dart';
import 'package:todolist/Screens/RegistrationScreen.dart';
import 'package:todolist/Screens/WelcomeScreen.dart';
import 'package:todolist/Screens/DashBoard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/register': (context) => const Register(),
        '/dashboard': (context) => DashBoard(username: ModalRoute.of(context)?.settings.arguments as String)
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF5F5F5)),
        useMaterial3: true,
      ),
    );
  }
}
