import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('key를 이용하여 위젯을 찾을 수 있다.', (tester) async {
    final testKey = Key('test');

    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            key: testKey,
            body: Center(
                child: Text(
              'Hello, World!',
            )))));

    final widgetFinder = find.byKey(testKey);

    expect(widgetFinder, findsOneWidget);
  });
}
