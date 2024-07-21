import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class TodoController extends GetxController {
  RxList todoData = [
    // {
    //   'task': "Reading",
    //   'description': "read any book today",
    //   'is_completed': false,
    // }
  ].obs;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void updateTaskCompletion(bool value, int index) {
    todoData[index]['is_completed'] = value;
    todoData.refresh();
  }

  void updatetask(int index, String description, String task) {
    todoData[index] = {
      'task': task,
      'description': description,
      'is_completed': false,
    };
  }

  void addTask(String task, String description) {
    todoData.insert(0, {
      'task': task,
      'description': description,
      'is_completed': false,
    });
    listKey.currentState!.insertItem(0);
    todoData.refresh(); // Refresh the list to update the UI
  }

  void deleteTask(int index) {
    if (index >= 0 && index < todoData.length) {
      var removedItem = todoData.removeAt(index);
      if (listKey.currentState != null) {
        listKey.currentState!.removeItem(
          index,
          (context, animation) => SizeTransition(
              sizeFactor: animation,
              child: Container(
                color: Colors.red,
                height: 50,
                width: double.infinity,
              )

              // Card(
              //   child: ListTile(
              //     title: Text(removedItem['task']),
              //     subtitle: Text(removedItem['description']),
              //   ),
              // ),
              ),
          duration: const Duration(milliseconds: 0),
        );
      }
      todoData.refresh(); // Refresh the list to update the UI
    }
  }
}
