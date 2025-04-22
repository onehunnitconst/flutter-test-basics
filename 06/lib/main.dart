import 'package:flutter/material.dart';
import 'package:flutter_test_basics/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(1000, (index) => 'Item $index');

    return MaterialApp(
      home: Scaffold(
        body: HomeScreen(items: items),
      ),
    );
  }
}
