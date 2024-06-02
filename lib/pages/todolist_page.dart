import 'package:fishnotes/models/task.dart';
import 'package:fishnotes/widgets/task_item.dart';
import 'package:flutter/material.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final taskList = sampleTasks;
  List<Task> foundTask = [];
  final taskController = TextEditingController();

  @override
  void initState() {
    foundTask = taskList;
    super.initState();
  }

  void handleTaskChange(Task task) {
    setState(() {
      task.isDone = !task.isDone;
    });
  }

  void deleteTask(String id) {
    setState(() {
      taskList.removeWhere((task) => task.id == id);
    });
  }

  void addTaskItem(String task) {
    if (taskController.text != "") {
      setState(() {
        taskList.add(Task(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            content: task));
      });
      taskController.clear();
    }
  }

  void runFilter(String enteredKeyword) {
    List<Task> results = [];
    if (enteredKeyword.isEmpty) {
      results = taskList;
    } else {
      results = taskList
          .where((item) =>
              item.content.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundTask = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FISH To Do List',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) => runFilter(value),
            style: const TextStyle(fontSize: 16, color: Colors.white),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              hintText: "Search tasks...",
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              fillColor: Colors.grey.shade800,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: foundTask.length,
                  itemBuilder: (context, index) {
                    return TaskItem(
                      task: foundTask[index],
                      onTaskChange: handleTaskChange,
                      onDeleteItem: deleteTask,
                    );
                  })),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextField(
                  controller: taskController,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: "Add a task",
                    hintStyle: const TextStyle(color: Colors.grey),
                    fillColor: Colors.grey.shade800,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                shape: const CircleBorder(eccentricity: 0),
                onPressed: () {
                  addTaskItem(taskController.text);
                },
                elevation: 10,
                backgroundColor: Colors.grey.shade800,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ]));
  }
}
