class Task {
  String id;
  String content;
  bool isDone;

  Task({
    required this.id,
    required this.content,
    this.isDone = false,
  });
}

List<Task> sampleTasks = [
  Task(
    id: "0",
    content: 'FISH To Do App',
  ),
  Task(
    id: "1",
    content: 'By Felix, Ivan, Steven, Hammam',
    isDone: true,
  ),
  Task(
    id: "2",
    content: 'To create a task, just type the task and press Add!',
  ),
  Task(
    id: "3",
    content: "Once you're task is done, you check it off and delete it! ",
  ),
];
