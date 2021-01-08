import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallback;
  final Function removeTask;

  TaskTile(
      {this.isChecked, this.taskTitle, this.checkBoxCallback, this.removeTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      leading: Checkbox(
        activeColor: Color(0xFF1c4e99),
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        color: Color(0xFFef005c),
        onPressed: removeTask,
      ),
    );
  }
}

/*
//With longPress Functionality
//
Widget build(BuildContext context) {
  return ListTile(
    onLongPress: longPressCallback,
    title: Text(
      taskTitle,
      style: TextStyle(
        decoration:
        isChecked ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    ),
    trailing: Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: isChecked,
      onChanged: checkBoxCallback,
    ),
  );
}

 */
