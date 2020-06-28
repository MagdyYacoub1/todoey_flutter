import 'package:flutter/material.dart';
import 'package:todoeyflutter/Screens/buttom_sheet_screen.dart';
import 'package:todoeyflutter/task.dart';

class TaskTile extends StatelessWidget {
  final Function toggleCheckBox;
  final Function deleteTask;
  final Task taskInstance;
  TaskTile({@required this.taskInstance, this.toggleCheckBox, this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "${taskInstance.taskName}",
        style: TextStyle(
          decoration: taskInstance.isDone ? TextDecoration.lineThrough : null,
          fontSize: 20.0,
        ),
      ),
      trailing: Checkbox(
        value: taskInstance.isDone,
        activeColor: Colors.lightBlueAccent,
        onChanged: toggleCheckBox,
      ),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => TaskDetails(
                  clickedTask: taskInstance,
                ));
      },
      onLongPress: deleteTask,
    );
  }
}
