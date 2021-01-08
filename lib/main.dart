import 'package:flutter/material.dart';
import 'package:atodo/models/task_data.dart';
//Import screens
import 'package:atodo/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(AToDo());

class AToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
