import 'package:flutter/material.dart';

// Reusable TextFormField widget
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

// Reusable Switch widget
Widget buildSwitch({
  required bool value,
  required ValueChanged<bool> onChanged,
  double scale = 0.7,
}) {
  return Transform.scale(
    scale: scale,
    child: Switch(
      value: value,
      onChanged: onChanged,
      activeColor: Colors.green,
      inactiveThumbColor: Colors.grey,
      activeTrackColor: Colors.lightGreen,
      inactiveTrackColor: Colors.grey[300],
    ),
  );
}

// Reusable Button widget
Widget buildButton({
  required String text,
  required VoidCallback onPressed,
  Color backgroundColor = Colors.blue,
  Color foregroundColor = Colors.white,
}) {
  return SizedBox(
    width: 250,
    child: OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide.none,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18.0),
      ),
    ),
  );
}

// Reusable Divider with text widget
Widget buildDividerWithText(String text) {
  return Center(
    child: SizedBox(
      width: 250,
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}

// Reusable Google button widget
Widget buildGoogleButton(VoidCallback onPressed) {
  return SizedBox(
    width: 250,
    child: OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey),
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      ),
      icon: Image.asset(
        'assets/Adobe_Express_20240620_1138460_1.png',
        height: 30.0,
        width: 24.0,
      ),
      label: const Text(
        'Google',
        style: TextStyle(fontSize: 18.0),
      ),
    ),
  );
}

Widget CardBuilder(
    {required Icon icon, required String text, required String count}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
            10.0), // Optional: Add border radius for rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10.0,
            left: 10.0,
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 251, 248, 248),
              ),
              child: Center(
                child: icon,
              ),
            ),
          ),
          const SizedBox(
            height: 180.0,
            width: 150.0,
          ),
          Positioned(
              bottom: 50,
              left: 10,
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w400),
              )),
          Positioned(
              bottom: 25,
              left: 10,
              child: Text(
                count,
                style: const TextStyle(fontWeight: FontWeight.w600),
              )),
        ],
      ),
    ),
  );
}
