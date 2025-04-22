import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_basics/main.dart';

void main() {
  testWidgets('스크롤 핸들링 테스트', (tester) async {
    await tester.pumpWidget(MyApp());

    final int index = 50;
    final double scrollOffset = 100.0;

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(ValueKey('item_$index'));

    await tester.scrollUntilVisible(
      itemFinder,
      scrollOffset,
      scrollable: listFinder,
    );

    expect(itemFinder, findsOneWidget);
  });
}
