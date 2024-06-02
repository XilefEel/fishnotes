class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}

List<Note> sampleNotes = [
  Note(
    id: 0,
    title: 'FISH Notes App',
    content: 'By Felix, Ivan, Steven, Hammam',
    modifiedTime: DateTime(2024, 1, 1, 1, 1),
  ),
  Note(
    id: 1,
    title: 'To Create a Note',
    content: 'Press the Add Button and Start Creating!',
    modifiedTime: DateTime(2024, 1, 1, 1, 1),
  ),
  Note(
    id: 2,
    title: 'You Can Edit, Search, Sort, and Delete Your Notes',
    content: 'Pretty Cool Right?',
    modifiedTime: DateTime(2024, 1, 1, 1, 1),
  ),
  Note(
    id: 3,
    title: 'Enjoy Using This App',
    content: 'content',
    modifiedTime: DateTime(2024, 1, 1, 1, 1),
  ),
];
