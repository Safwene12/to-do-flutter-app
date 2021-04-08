

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksData extends ChangeNotifier{
  List<Task> _tasks =[
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  int get taskCount{
    return _tasks.length;
  }

  Task getTask (String title){
    _tasks.forEach((element) {
      if(element.name == title){
        return element;
      }
    });
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(Task t){
    _tasks.add(t);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTasks(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

}