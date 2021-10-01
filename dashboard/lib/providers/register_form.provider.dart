import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  String name = '';

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  void validateForm() {
    if (formKey.currentState!.validate()) {
      print("valido");
    } else {
      print("invalido");
    }
  }
}
