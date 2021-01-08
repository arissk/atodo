import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_tile.dart';
//Import Models
import 'package:atodo/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkBoxCallback: (bool checkBoxState) {
              taskData.updateTask(task);
            },
            removeTask: () {
              taskData.deleteTask(task);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
