import 'package:dashboard_/api/CafeApi.dart';
import 'package:dashboard_/models/http/auth_response.dart';
import 'package:dashboard_/router/router.dart';
import 'package:dashboard_/services/local_storage.dart';
import 'package:dashboard_/services/navigation_service.dart';
import 'package:dashboard_/services/notifications_service.dart';
import 'package:flutter/cupertino.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider with ChangeNotifier {
  String? _token;
  Usuario? user;

  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    final data = {
      "correo": email,
      "password": password,
    };

    CafeApi.post('/auth/login', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      CafeApi.configureDio();

      notifyListeners();
    }).catchError((e) {
      print("Erro em: ${e.toString()}");
      NotificationsService.showSnackbarError("Usuairo / password invalidos");
    });
  }

  register(String email, String password, String name) {
    final data = {
      "nombre": name,
      "correo": email,
      "password": password,
    };

    CafeApi.post('/usuarios', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      print("Erro em: $e");
      NotificationsService.showSnackbarError("Usuairo / password invalidos");
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString("token");
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final response = await CafeApi.httpGet("/api/auth");

      final authResponse = AuthResponse.fromMap(response);
      this.user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();

      return true;
    } catch (e) {
      print(e);

      AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
