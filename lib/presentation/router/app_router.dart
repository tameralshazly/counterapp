import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';
import '../../core/exceptions/route_exception.dart';
import 'package:counterapp/presentation/screens/counter_screen/counter_screen.dart';

class AppRouter {
  static const String counter = 'counter';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case counter:
        return MaterialPageRoute(
          builder: (_) => const CounterScreen(
            title: Strings.counterScreenTitle,
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
