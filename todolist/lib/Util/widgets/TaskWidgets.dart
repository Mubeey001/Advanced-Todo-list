import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Padding taskWidgets({
  required String taskName,
  required String taskDescription,
  required bool taskCompleted,
  required Function(bool?)? onChanged,
  required Function(BuildContext)? onDelete,
  required Function(BuildContext)?
      onEdit, 
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
          onPressed: onEdit, 
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
          subtitle: Text(
            taskDescription,
            style: TextStyle(color: Colors.grey[600]),
            maxLines: 1, 
            overflow: TextOverflow.ellipsis, 
          ),
          title: Text(
            taskName,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    ),
  );
}
