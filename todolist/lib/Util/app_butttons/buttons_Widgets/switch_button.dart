import 'package:flutter/material.dart';

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
