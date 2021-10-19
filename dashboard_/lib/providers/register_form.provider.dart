import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  String name = '';

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
