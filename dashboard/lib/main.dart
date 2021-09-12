import 'package:dashboard/router/router.dart';
import 'package:flutter/material.dart';

import 'ui/layout/auth/auth_layout.dart';

void main() {
  // Flurorouter.configureRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Dashboard',
      debugShowCheckedModeBanner: false,
      
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      builder: (_, child) {
        return AuthLayout();
      },
    );
  }
}
