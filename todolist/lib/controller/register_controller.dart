import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isOn = false.obs;

  void submit() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    Get.offAllNamed('/dashboard', arguments: {
      'username': usernameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    });
  }
}
