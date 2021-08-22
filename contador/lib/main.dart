import 'package:contador/locator.dart';
import 'package:contador/router/route_generator.dart';
import 'package:contador/router/router.dart';
import 'package:contador/ui/layout/main_layout_page.dart';
import 'package:flutter/material.dart';

import 'services/navigation_service.dart';

void main() {
  setupLocator();
  Flurorouter.configureRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rotas App',
      // onGenerateRoute: RouteGenerator.generateRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: locator<NavigationService>().navigatorKey,
      builder: (_, child) {
        return MainLayoutPage(
          child: child ?? Container(),
        );
      },
    );
  }
}
