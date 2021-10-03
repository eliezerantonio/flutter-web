import 'package:dashboard/providers/auth_provider.dart';
import 'package:dashboard/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/layout/auth/auth_layout.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        title: 'Admin Dashboard',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router.generator,
        builder: (_, child) {
          return AuthLayout(
            child: child!,
          );
        },
        theme: ThemeData.light().copyWith(
          scrollbarTheme: ScrollbarThemeData().copyWith(
            thumbColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
