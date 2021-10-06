import 'package:dashboard/providers/auth_provider.dart';
import 'package:dashboard/router/router.dart';
import 'package:dashboard/services/local_storage.dart';
import 'package:dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/sidemenu_provider.dart';
import 'ui/layout/auth/auth_layout.dart';
import 'ui/layout/dashboard/dashboard_layout.dart';
import 'ui/layout/splash/splash_layout.dart';

void main() async {
  await LocalStorage.configurePrefs();

  Flurorouter.configureRoutes();
  runApp(ProviderApp());
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => SideMenuProvider(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Dashboard',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.nivigatorKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking)
          return SplashLayout();

        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.5)),
        ),
      ),
    );
  }
}
