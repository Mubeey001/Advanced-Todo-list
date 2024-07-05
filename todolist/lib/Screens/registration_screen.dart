import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/Util/constants/images.dart';
import 'package:todolist/Util/validator/validator.dart';
import 'package:todolist/Util/widgets/build_divider_with_text.dart';
import 'package:todolist/controller/register_controller.dart';

import '../Util/app_butttons/buttons_Widgets/switch_button.dart';
import '../Util/app_butttons/app_button_widgets.dart';
import '../Util/widgets/text_form_field_widget.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Register',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30.0),
                  buildTextFormField(
                    textEditingController: controller.usernameController,
                    labelText: 'Name',
                    hintText: 'Enter user name',
                    keyboardType: TextInputType.name,
                    validator: (value) =>
                        AppValidator.validateEmptyText('Name', value),
                  ),
                  const SizedBox(height: 30.0),
                  buildTextFormField(
                    textEditingController: controller.emailController,
                    labelText: 'Email',
                    hintText: 'Enter user email (optional)',
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: const Icon(Icons.email),
                    validator: (value) => AppValidator.validEmail(value),
                  ),
                  const SizedBox(height: 30.0),
                  buildTextFormField(
                    textEditingController: controller.passwordController,
                    labelText: 'Password',
                    hintText: 'Create Password',
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    validator: (value) => AppValidator.validatePassword(value),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Accept',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Terms and Conditions'),
                      ),
                      Obx(() => buildSwitch(
                            value: controller.isOn.value,
                            onChanged: (value) {
                              controller.isOn.value = value;
                            },
                          )),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: buildButton(
                      border: BorderSide.none,
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        text: 'Sign Up',
                        onPressed: controller.submit),
                  ),
                  const SizedBox(
                      height: 20), // Space between button and divider
                  buildDividerWithText('Or register with'),
                  const SizedBox(
                      height: 20), // Space between divider and Google button
                  Center(
                    child: buildButton(
                        border: const BorderSide(color: Colors.grey),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        text: 'Google',
                        onPressed: () {},
                        imagePath: AppImages.googleLogo),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Do you have an account?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 1),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
