import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List todoList = [];

  // reference our box

  final myBox = Hive.box('myBox');

  void initTodoList() {
    todoList = [
      ["Learn Flutter", false],
      ["Do Exercise", false],
    ];
  }

  void loadData() {
    todoList = myBox.get('TODOLIST');
  }

  void updateData() {
    myBox.put('TODOLIST', todoList);
  }
}
