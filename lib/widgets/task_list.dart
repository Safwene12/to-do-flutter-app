import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/Provider/tasks_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, taskData, child){
        return ListView.builder(itemBuilder: (context , index){
          final task = taskData.tasks[index];
          return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback : (bool checkboxState){
                taskData.updateTask(task);
              },
             longPressCallback: (){
                taskData.deleteTasks(task);
             },
          );
        }, itemCount: taskData.taskCount,);
      }

    );
  }
}