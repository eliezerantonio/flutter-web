import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  String email = '';
  String password = '';

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  void validateForm() {
    if (formKey.currentState!.validate()) {
      print('$email ==== $password');
    } else {}
  }
}
