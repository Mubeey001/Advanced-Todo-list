import 'package:flutter/material.dart';
import 'package:todolist/components/component.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isOn = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    Navigator.pushNamed(
      context,
      '/dashboard',
      arguments: {
        'username': _usernameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      },
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
                    textEditingController: _usernameController,
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
                    textEditingController: _emailController,
                    labelText: 'Email',
                    hintText: 'Enter user email (optional)',
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: const Icon(Icons.email),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                              .hasMatch(value)) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  buildTextFormField(
                    textEditingController: _passwordController,
                    labelText: 'Password',
                    hintText: 'Create Password',
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return 'Password can\'t be null or less than 4 characters';
                      }
                      return null;
                    },
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
