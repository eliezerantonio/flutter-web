import 'package:dashboard/api/CafeApi.dart';
import 'package:dashboard/services/local_storage.dart';
import 'package:flutter/cupertino.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider with ChangeNotifier {
  String? _token;

  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    //TODO:requiscao http
    this._token = "ladlkajsdpajdoihf;osdhflshdfodsuhfokd";

    LocalStorage.prefs.setString('token', this._token!);
    LocalStorage.prefs.get("token");
    authStatus = AuthStatus.authenticated;
    notifyListeners();
  }

  register(String email, String password, String name) {
    final data = {
      "nombre": name,
      "correo": email,
      "password": password,
    };

    CafeApi.post('/usuarios', data).then((json) {
      print(json);
    }).catchError((e) {
      print("Erro em: $e");
    });

    // LocalStorage.prefs.setString('token', this._token!);
    // LocalStorage.prefs.get("token");
    // authStatus = AuthStatus.authenticated;
    // notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString("token");
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

//TODO:ir ao backend

    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
