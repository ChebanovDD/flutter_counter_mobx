import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'counter_store.g.dart';

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  static const String _valuePrefsKey = 'counterValue';

  _CounterStore() {
    _loadValue();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    _setValue(value + 1);
  }

  @action
  void decrement() {
    _setValue(value - 1);
  }

  void _setValue(int value) {
    this.value = value;
    _saveValue();
  }

  Future<void> _saveValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_valuePrefsKey, value);
  }

  Future<void> _loadValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getInt(_valuePrefsKey) ?? 0;
  }
}