import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic/stores/counter_store.dart';
import 'logic/stores/theme_store.dart';
import 'material_app.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => ThemeStore()),
        Provider<CounterStore>(create: (_) => CounterStore())
      ],
      child: Consumer<ThemeStore>(
          builder: (_, store, __) => CounterApp(themeStore: store)
      ),
    );
  }
}
