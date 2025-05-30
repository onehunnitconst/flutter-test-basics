import 'package:flutter/material.dart';
import 'package:flutter_test_basics/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(
        title: "title",
        message: "message",
      ),
    );
  }
}