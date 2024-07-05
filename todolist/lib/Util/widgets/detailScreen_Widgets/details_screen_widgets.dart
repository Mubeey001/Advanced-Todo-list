import 'package:flutter/material.dart';

Widget buildDetailRow(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      const SizedBox(height: 8),
      Text(
        value,
        style: const TextStyle(fontSize: 16),
      ),
    ],
  );
}

Widget buildStatusRow(bool completed) {
  return Row(
    children: [
      const Text(
        'Task Status:',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      const SizedBox(width: 8),
      Text(
        completed ? 'Completed' : 'Incomplete',
        style: TextStyle(
          fontSize: 16,
          color: completed ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
