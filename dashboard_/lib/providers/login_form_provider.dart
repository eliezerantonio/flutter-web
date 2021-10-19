import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  String email = '';
  String password = '';

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      print('$email ==== $password');

      return true;
    } else {
      print("form not valid");
      return false;
    }
  }
}
