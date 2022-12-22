import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_with_hive/src/app.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();

  // open box
  await Hive.openBox('myBox');

  runApp(const MyApp());
}
