import 'package:dashboard_/api/CafeApi.dart';
import 'package:dashboard_/models/http/users_response.dart';
import 'package:dashboard_/models/usuario.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  UsersProvider() {
    this.getPaginatedUsers();
  }

  List<Usuario> users = [];
  bool isLoading = true;

  getPaginatedUsers() async {
    final resp = await CafeApi.httpGet("/usuarios?limite=10&desde=0");

    final usersResponse = UsersResponse.fromMap(resp);

    users = [...usersResponse.usuarios];

    isLoading = false;
    notifyListeners();
  }
}
