import 'package:contador/ui/pages/counter_page.dart';
import 'package:contador/ui/pages/counter_provider_page.dart';
import 'package:contador/ui/pages/page404.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/stateful':
        return _fadeRoute(CounterPage(), '/stateful');

      case '/provider':
        return _fadeRoute(CounterProviderPage(), '/provider');

      default:
        return _fadeRoute(Page404(), '/page404');
    }
  }

  static PageRoute _fadeRoute(Widget child, String routeName) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => child,
      settings: RouteSettings(name: routeName),
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (_, animation, __, ___) => kIsWeb
          ? FadeTransition(opacity: animation, child: child)
          : CupertinoPageTransition(
              primaryRouteAnimation: animation,
              secondaryRouteAnimation: __,
              child: child,
              linearTransition: true,
            ),
    );
  }
}
