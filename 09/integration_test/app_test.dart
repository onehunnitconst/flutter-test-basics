import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_basics/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('스크롤 퍼포먼스 테스트', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final int findIndex = 100;
    final double scrollOffset = 1000.0;

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(ValueKey('item_${findIndex}_text'));

    await binding.traceAction(
      () async {
        await tester.scrollUntilVisible(
          itemFinder,
          scrollOffset,
          scrollable: listFinder,
        );
      },
      reportKey: 'scrolling_timeline',
    );

    expect(itemFinder, findsOneWidget);
  });
}
