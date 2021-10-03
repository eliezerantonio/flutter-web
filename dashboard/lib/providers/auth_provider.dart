import 'package:dashboard/services/local_storage.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  String? _token;

  login(String email, String password) {
    //TODO:requiscao http
    this._token = "ladlkajsdpajdoihf;osdhflshdfodsuhfokd";

    LocalStorage.prefs.setString('token', this._token!);
    LocalStorage.prefs.get("token");
    notifyListeners();
  }
}
