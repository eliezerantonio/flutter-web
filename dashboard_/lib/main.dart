import 'package:dashboard_/providers/auth_provider.dart';
import 'package:dashboard_/providers/categories_provider.dart';
import 'package:dashboard_/providers/user_form_provider.dart';
import 'package:dashboard_/providers/users_provider.dart';
import 'package:dashboard_/router/router.dart';
import 'package:dashboard_/services/local_storage.dart';
import 'package:dashboard_/services/navigation_service.dart';
import 'package:dashboard_/services/notifications_service.dart';
import 'package:dashboard_/ui/layout/dashboard/dashboard_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_/api/CafeApi.dart';
import 'providers/sidemenu_provider.dart';
import 'ui/layout/auth/auth_layout.dart';

import 'ui/layout/splash/splash_layout.dart';

void main() async {
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(const ProviderApp());
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
        ChangeNotifierProvider(
          create: (_) => CategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UsersProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserFormProvider(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Dashboard',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      scaffoldMessengerKey: NotificationsService.messengerKey,
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
