import 'package:dashboard_/providers/auth_provider.dart';
import 'package:dashboard_/ui/views/dashboard_view.dart';
import 'package:dashboard_/ui/views/login_view.dart';
import 'package:dashboard_/ui/views/register_view.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
   static Handler login = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return LoginView();
    else
      return DashboardView();
  });

  static Handler register = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return RegisterView();
    else
      return DashboardView();
  });

}
