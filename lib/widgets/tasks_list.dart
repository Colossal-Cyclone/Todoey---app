import 'package:flutter/material.dart';
import 'package:todoeyflutter/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/model/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              longPressCallback: (){
                taskData.deleteTask(task);
              },
                title: task.name,
                isChecked: task.isDone,
                checkboxCallback: (bool checkboxState) {
                  taskData.updateTask(task);
                });
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
