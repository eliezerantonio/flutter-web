import 'package:contador/router/route_generator.dart';
import 'package:contador/ui/layout/main_layout_page.dart';
import 'package:flutter/material.dart';

import 'services/navigation_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rotas App',
      initialRoute: '/stateful',
      onGenerateRoute: RouteGenerator.generateRoute,
    navigatorKey: navigationService.navigatorKey,
      builder: (_, child) {
        return MainLayoutPage(
          child: child ?? Container(),
        );
      },
    );
  }
}
