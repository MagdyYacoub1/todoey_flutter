import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:todoeyflutter/TasksData.dart';
import 'package:provider/provider.dart';

class AddTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Hero(
      tag: 'addScreen',
      createRectTween: _CreatRectTween,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New Task',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                  onChanged: (value) {
                    newTaskTitle = value;
                  },
                ),
                Spacer(
                  flex: 1,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Text(
                          'Add Task',
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Provider.of<TasksData>(context, listen: false)
                              .addTask(newTaskTitle);
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
                Spacer(
                  flex: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static RectTween _CreatRectTween(Rect begin, Rect end) {
    return CircularRectTween(begin: begin, end: end);
  }
}

class CircularRectTween extends RectTween {
  CircularRectTween({Rect begin, Rect end}) : super(begin: begin, end: end) {}

  @override
  Rect lerp(double t) {
    final double width = lerpDouble(begin.width, end.width, t);
    double startWidthCenter = begin.left + (begin.width / 2);
    double startHeightCenter = begin.top + (begin.height / 2);

    return Rect.fromCircle(
        center: Offset(startWidthCenter, startHeightCenter),
        radius: width * 1.7);
  }
}
