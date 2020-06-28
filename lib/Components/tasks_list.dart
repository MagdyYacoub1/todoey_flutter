import 'package:flutter/material.dart';
import 'package:todoeyflutter/Components/TaskTile.dart';
import 'package:todoeyflutter/TasksData.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskInstance: task,
              toggleCheckBox: (bool newValue) {
                taskData.updateTask(task);
              },
              deleteTask: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.tasksCount,
        );
      },
    );
  }
}
