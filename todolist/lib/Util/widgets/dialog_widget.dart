import 'package:flutter/material.dart';
import 'package:todolist/Util/constants/size.dart';
import 'package:todolist/Util/app_butttons/buttons_Widgets/dialog_Button.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.textEditingController,
    required this.descriptionEditingController,
  });

  final VoidCallback onSave, onCancel;
  final TextEditingController textEditingController,
      descriptionEditingController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: SizedBox(
        height: 230,
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Title'),
            ),
            SizedBox(height: AppSize.spaceBtwElementSm),
            TextField(
              controller: descriptionEditingController,
              maxLines: 2,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Description'),
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: AppSize.spaceBtwElementSm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DialogButton(
                  text: 'Save',
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 8,
                ),
                DialogButton(
                  text: 'Cancel',
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
