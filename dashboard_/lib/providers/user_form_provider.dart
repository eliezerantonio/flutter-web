import 'package:dashboard_/api/CafeApi.dart';
import 'package:dashboard_/models/usuario.dart';

import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;

 late GlobalKey<FormState> formKey;

  void updateListeners() {
    notifyListeners();
  }

  copyUserWith(
      {String? rol,
      bool? estado,
      bool? google,
      String? nombre,
      String? correo,
      String? uid,
      String? img}) {
    user = Usuario(
      rol: rol ?? user!.rol,
      estado: estado ?? user!.estado,
      google: google ?? user!.google,
      correo: correo ?? user!.correo,
      nombre: nombre ?? user!.nombre,
      uid: uid ?? user!.uid,
      img: img ?? user!.img,
    );
    notifyListeners();
  }

  bool validForm() {
    return formKey.currentState!.validate();
  }

  Future updateUser() async {
    if (!validForm()) return false;

    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo,
    };

    try {
      final resp = await CafeApi.put('/usuarios/${user!.uid}', data);
      return true;
    } catch (e) {
      debugPrint("error en updateUser: $e");

      return false;
    }
  }
}
