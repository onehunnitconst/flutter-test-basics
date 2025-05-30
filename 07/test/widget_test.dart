import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_basics/main.dart';

void main() {
  testWidgets('텍스트 입력, 드래그하여 삭제', (tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterText(find.byType(TextField), 'Hi');
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.text('Hi'), findsOneWidget);

    await tester.drag(find.byType(Dismissible), Offset(500, 0));
    await tester.pumpAndSettle();

    expect(find.text('Hi'), findsNothing);
  });
}
