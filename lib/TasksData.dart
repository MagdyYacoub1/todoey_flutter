import 'package:flutter/cupertino.dart';
import 'package:todoeyflutter/task.dart';
import 'dart:collection';

class TasksData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(taskName: 'finish the course'),
    Task(taskName: 'go to sleep'),
    Task(taskName: 'start in the researshes'),
  ];

  int get tasksCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    _tasks.add(Task(taskName: newTaskTitle));
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
}
