import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_basics/counter.dart';

void main() {
  group('Counter', () {
    test('0으로 시작해야 한다', () {
      final Counter counter = Counter();

      expect(counter.value, 0);
    });

    test('1 증가', () {
      final Counter counter = Counter();

      counter.countUp();

      expect(counter.value, 1);
    });

    test('1 감소', () {
      final Counter counter = Counter();

      counter.countDown();

      expect(counter.value, -1);
    });

    test('초기화', () {
      final Counter counter = Counter();

      counter
        ..countUp()
        ..countUp();

      counter.clear();

      expect(counter.value, 0);
    });
  });
}
