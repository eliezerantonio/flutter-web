import 'package:dashboard_/api/CafeApi.dart';
import 'package:dashboard_/models/category.dart';
import 'package:dashboard_/models/http/categories_response.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categories = [];

  getCategories() async {
    final resp = await CafeApi.httpGet("/categorias");

    final categoriesResp = CategoriesResponse.fromMap(resp);

    categories = [...categoriesResp.categorias];
  
    notifyListeners();
  }
}
