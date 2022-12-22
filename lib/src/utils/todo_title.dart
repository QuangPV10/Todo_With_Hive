import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final bool isDone;
  final String taskName;
  final Function(bool?) onChange;
  final Function(BuildContext) delete;
  const TodoTile(
      {required this.delete, required this.taskName, required this.isDone, required this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red,
              onPressed: delete,
              borderRadius: BorderRadius.circular(25),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), topRight: Radius.circular(20))),
          child: Row(
            children: [
              Checkbox(value: isDone, onChanged: onChange, activeColor: Colors.black),
              Text(
                taskName,
                style: TextStyle(
                    decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
