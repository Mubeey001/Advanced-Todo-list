import 'package:flutter/material.dart';

import 'package:todolist/components/component.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

final _formKey = GlobalKey<FormState>();
final TextEditingController _useNameController = TextEditingController();
bool _isOn = false;

class _RegisterState extends State<Register> {
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    Navigator.pushNamed(
      context,
      '/dashboard',
      arguments: _useNameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
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
                    textEditingController: _useNameController,
                    labelText: 'Name',
                    hintText: 'Enter user name',
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username can\'t be empty';
                      }
                      if (value.length > 8) {
                        return 'Username can\'t be greater than 8';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  buildTextFormField(
                    labelText: 'Email',
                    hintText: 'Enter user email (optional)',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 30.0),
                  buildTextFormField(
                    labelText: 'Password',
                    hintText: 'Create Password (optional)',
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    suffixIcon: const Icon(Icons.remove_red_eye),
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
                      buildSwitch(
                        value: _isOn,
                        onChanged: (value) {
                          setState(() {
                            _isOn = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: buildButton(text: 'Sign Up', onPressed: _submit),
                  ),
                  const SizedBox(
                      height: 20), // Space between button and divider
                  buildDividerWithText('Or register with'),
                  const SizedBox(
                      height: 20), // Space between divider and Google button
                  Center(
                    child: buildGoogleButton(() {}),
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
                      TextButton(onPressed: () {}, child: const Text('Login')),
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
