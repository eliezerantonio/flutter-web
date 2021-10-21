import 'package:dashboard_/api/CafeApi.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List categories = [];

  getCategories() async {
    final resp = await CafeApi.httpGet("/categorias");

    print(resp);
// final categoriesResp=CategoriesResponse.fromMap(resp);

// this.categories=[...categoriesResp.categorias]

    notifyListeners();
  }
}
