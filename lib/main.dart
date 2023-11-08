import 'package:flutter/material.dart';
import 'package:twitter_clone_coding/screen/screen-entry/entry.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const EntryScreen(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
    );
  }
}
