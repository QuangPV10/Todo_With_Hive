import 'package:flutter/material.dart';
import 'package:todo_with_hive/src/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({required this.onCancel, required this.onSave, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), hintText: 'add a new task'),
      ),
      // title: const Center(child: Text('Create New Task')),
      actions: [
        MyButton(onPress: onCancel, text: 'Cancel'),
        MyButton(onPress: onSave, text: 'Submit'),
      ],
    );
  }
}
