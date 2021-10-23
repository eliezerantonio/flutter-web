import 'package:dashboard_/api/CafeApi.dart';
import 'package:dashboard_/models/http/users_response.dart';
import 'package:dashboard_/models/usuario.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  UsersProvider() {
    getPaginatedUsers();
  }

  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

  getPaginatedUsers() async {
    final resp = await CafeApi.httpGet("/usuarios?limite=10&desde=0");

    final usersResponse = UsersResponse.fromMap(resp);

    users = [...usersResponse.usuarios];

    isLoading = false;
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    ascending = !ascending;
    notifyListeners();
  }
}
