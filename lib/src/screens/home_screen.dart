import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_with_hive/src/data/database.dart';
import 'package:todo_with_hive/src/utils/dialog_box.dart';
import 'package:todo_with_hive/src/utils/todo_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myBox = Hive.box('myBox');
  final TextEditingController controller = TextEditingController();
  final TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    super.initState();
    if (myBox.get('TODOLIST') == null) {
      db.initTodoList();
    } else {
      db.loadData();
    }
  }

  bool isDone = false;

  void changeCheckBox(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        controller: controller,
        onCancel: onCancel,
        onSave: onSave,
      ),
    );
  }

  void onSave() {
    setState(() {
      db.todoList.add([controller.text.toString(), false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void delete(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  void onCancel() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('TO DO'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            isDone: db.todoList[index][1],
            onChange: (value) => changeCheckBox(value, index),
            delete: (context) => delete(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
