import 'package:dashboard_/api/CafeApi.dart';
import 'package:dashboard_/models/usuario.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> user = [];
  bool isLoading = true;

  getPaginatedUsers() async {
    final resp = await CafeApi.httpGet("usuarios?limite=10&desde=0");


   

    isLoading=false;
    notifyListeners();
  }
}
