import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_basics/home_screen.dart';

void main() {
  testWidgets('title, message가 잘 표시되어야 한다.', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          title: "title",
          message: "message",
        ),
      ),
    );

    // title 텍스트가 있는 위젯 찾기
    final titleFinder = find.text("title");

    // message 텍스트가 있는 위젯 찾기
    final messageFinder = find.text("message");

    // 검사하기
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
