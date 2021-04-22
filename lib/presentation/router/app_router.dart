import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';
import '../../core/exceptions/route_exception.dart';
import '../../presentation/screens/counter_screen/counter_screen.dart';

class AppRouter {
  const AppRouter._();

  static String get initialRoute => Strings.counterScreen;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Strings.counterScreen:
        return MaterialPageRoute<Widget>(builder: (_) => const CounterScreen());
      default:
        throw const RouteException(Strings.exceptionMsgRouteNotFound);
    }
  }
}