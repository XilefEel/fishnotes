import 'package:fishnotes/models/task.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final onTaskChange;
  final onDeleteItem;

  const TaskItem(
      {super.key,
      required this.task,
      required this.onTaskChange,
      required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: () {
          onTaskChange(task);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
            task.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.purple),
        title: Text(
          task.content,
          style: TextStyle(
              fontSize: 16,
              color: const Color.fromARGB(255, 117, 112, 112),
              decoration: task.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: IconButton(
          onPressed: () {
            onDeleteItem(task.id);
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
