//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Widget Import
import 'package:atodo/widgets/tasks_list.dart';
//Screen Import
import 'package:atodo/screens/add_task_screen.dart';
//Model Import
import 'package:atodo/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1c4e99),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1c4e99),
        child: Icon(Icons.add),
        onPressed: () {
          //Show Bottom Sheet for importing tasks
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen((newTaskTitle) {
              //Add Task to Tasks Lists
              Provider.of<TaskData>(context, listen: false).tasks.add(
                    newTaskTitle,
                  );
              Navigator.pop(context);
            }),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Color(0xFFffffff),
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Color(0xFF333333),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'ToDo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Color(0xFFf3f3f3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
