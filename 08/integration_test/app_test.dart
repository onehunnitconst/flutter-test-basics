import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_basics/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('e2e test', () {
    testWidgets('FAB를 탭하면 증가해야 한다', (tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('0'), findsOneWidget);

      final fabFinder = find.byTooltip('Increment');

      await tester.tap(fabFinder);
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
    });
  });
}
