import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task.dart';
import 'package:todoey_flutter/model/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          reverse: false,
          itemBuilder: (context, index) {
            final task = taskData
                .tasks[index]; // using final i can remover dataType Task
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPress: () {
                showDialog<void>(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.lightBlue[50],
                        title: Text('Delete?'),
                        content: Text(
                          'Do you want to delete?',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        actions: <Widget>[
                          FlatButton(
                              child:
                                  Text('No', style: TextStyle(fontSize: 20.0)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          FlatButton(
                              child:
                                  Text('Yes', style: TextStyle(fontSize: 20.0)),
                              onPressed: () {
                                taskData.deleteTask(task);
                                Navigator.of(context).pop();
                              }),
                        ],
                        elevation: 24.0,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      );
                    });
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
