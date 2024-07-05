import 'package:flutter/material.dart';

Widget buildButton({
  required String text,
  String? imagePath,
  required VoidCallback onPressed,
  required Color backgroundColor,
  required Color foregroundColor,
  required BorderSide border,
}) {
  return SizedBox(
    width: 250,
    child: OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: border,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      icon: imagePath != null
          ? Image.asset(
              imagePath,
              height: 30.0,
              width: 24.0,
            )
          : const SizedBox.shrink(),
      label: Text(
        text,
        style: const TextStyle(fontSize: 18.0),
      ),
    ),
  );
}
