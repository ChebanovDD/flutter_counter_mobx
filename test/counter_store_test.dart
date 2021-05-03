import 'package:flutter_counter_mobx/logic/stores/counter_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter', () {
    test('Counter value should be incremented', () {
      final counter = CounterStore();

      counter.increment();

      expect(counter.value, 1);
    });

    test('Counter value should be decremented', () {
      final counter = CounterStore();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}