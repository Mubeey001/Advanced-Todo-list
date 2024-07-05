import 'package:flutter/material.dart';

Widget buildTextFormField({
  required String labelText,
  required String hintText,
  required TextInputType keyboardType,
  TextEditingController? textEditingController,
  bool isPassword = false,
  String? Function(String?)? validator,
  Widget? suffixIcon,
}) {
  return TextFormField(
    controller: textEditingController,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      labelText: labelText,
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
      suffixIcon: suffixIcon,
    ),
    keyboardType: keyboardType,
    obscureText: isPassword,
    validator: validator,
  );
}
