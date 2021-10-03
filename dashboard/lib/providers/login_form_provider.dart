import 'package:dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  String email = '';
  String password = '';

  AuthProvider authProvider;

  LoginFormProvider(this.authProvider);

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  void validateForm() {
    if (formKey.currentState!.validate()) {
      print('$email ==== $password');
    } else {
      print("form not valid");
    }
  }
}
