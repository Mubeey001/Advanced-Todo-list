import 'package:flutter/material.dart';

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
