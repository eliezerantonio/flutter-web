import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  String? token;

  login(String email, String password) {
    //TODO:requiscao http

    notifyListeners();
  }
}
