import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:todoeyflutter/Screens/tasks_screen.dart';
import 'package:todoeyflutter/Screens/add_task_screen.dart';
import 'package:todoeyflutter/TasksData.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //timeDilation = 7.0;
    return ChangeNotifierProvider<TasksData>(
      create: (context) => TasksData(),
      child: MaterialApp(
        home: TasksScreen(),
        routes: {
          'taskscreen': (context) => TasksScreen(),
          'addtasksscreen': (context) => AddTasksScreen()
        },
      ),
    );
  }
}
