import 'dart:ui';

import 'package:fishnotes/pages/notes_page.dart';
import 'package:fishnotes/pages/todolist_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: PageView(
        scrollBehavior: const ScrollBehavior().copyWith(dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.trackpad
        }),
        children: const [NotesPage(), ToDoListPage()],
      ),
    );
  }
}
