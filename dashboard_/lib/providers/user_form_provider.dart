import 'package:dashboard_/models/usuario.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  updateUser() {
    if (!validForm()) return;
  }
}
