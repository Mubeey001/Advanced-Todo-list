import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Padding taskWidgets({
  required String taskName,
  required bool taskCompleted,
  required Function(bool?)? onChanged,
  required Function(BuildContext)? onDelete,
  required Function(BuildContext)? onEdit, // Add this parameter
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
    child: Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: onDelete,
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(8.0),
        ),
        SlidableAction(
          onPressed: onEdit, // Handle edit button press
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          icon: Icons.edit,
        ),
      ]),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          leading: Checkbox(value: taskCompleted, onChanged: onChanged),
          title: Text(taskName),
        ),
      ),
    ),
  );
}
