import 'package:flutter/material.dart';
import 'package:todoeyflutter/task.dart';

class TaskDetails extends StatelessWidget {
  final Task clickedTask;

  TaskDetails({this.clickedTask});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 13.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Task: ',
                    style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 25.0,
                        ),
                    children: <TextSpan>[
                      TextSpan(
                        text: clickedTask.taskName,
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          decoration: clickedTask.isDone
                              ? TextDecoration.lineThrough
                              : null,
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
