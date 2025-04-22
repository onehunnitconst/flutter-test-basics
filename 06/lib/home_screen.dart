import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> items;

  const HomeScreen({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        key: const Key('long_list'),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            key: Key('item_$index'),
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
