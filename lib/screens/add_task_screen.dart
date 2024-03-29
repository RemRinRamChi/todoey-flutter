import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskText;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 30.0,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newValue) {
                  taskText = newValue;
                },
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent),
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (taskText != null && taskText.isNotEmpty) {
                  Provider.of<TaskData>(context).addTask(taskText);
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
