import 'package:flutter/material.dart';
import 'package:flutter_test_basics/home_screen.dart';


// Handle scrolling
// https://docs.flutter.dev/cookbook/testing/widget/scrolling

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(
        items: List.generate(10000, (i) => "Item $i"),
      ),
    );
  }
}
