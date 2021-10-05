import 'package:dashboard/providers/auth_provider.dart';
import 'package:dashboard/ui/views/dashboard_view.dart';
import 'package:dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return DashboardView();
    else
      return LoginView();
  });
}
