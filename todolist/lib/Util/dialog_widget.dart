import 'package:flutter/material.dart';
import 'package:todolist/Util/dialog_Button.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key, required this.onSave, required this.onCancel, required this.textEditingController});

  final VoidCallback onSave, onCancel;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Container(
        height: 140,
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Create a task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogButton(
                  text: 'Save',
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 8,
                ),
                DialogButton(
                  text: 'Cansel',
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
