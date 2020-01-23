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
              longPress: () => taskData.deleteTask(task),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
