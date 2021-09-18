import 'package:dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc:
      (BuildContext? context, Map<String, List<String>> parameters) {
    return LoginView();
  });
}
