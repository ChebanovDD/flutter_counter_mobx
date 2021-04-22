import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'logic/stores/counter_store.dart';
import 'logic/stores/theme_store.dart';
import 'presentation/router/app_router.dart';

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

class CounterApp extends StatefulWidget {
  const CounterApp({@required this.themeStore});

  final ThemeStore themeStore;

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    widget.themeStore.updateAppTheme();
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        title: Strings.appTitle,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: widget.themeStore.themeMode,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.initialRoute,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
