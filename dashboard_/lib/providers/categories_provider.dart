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

  Future newCategory(String name) async {
    final data = {
      'nombre': name,
    };

    try {
      final json = await CafeApi.post('/categorias', data);

      final newCategory = Categoria.fromMap(json);

      categories.add(newCategory);
      notifyListeners();
    } catch (e) {
      throw 'Erro ao criar a categoria ';
    }
  }

  Future updateCategory(String name, String id) async {
    final data = {
      'nombre': name,
    };

    try {
      final json = await CafeApi.put('/categorias/$id', data);

      categories = categories.map((category) {
        if (category.id != id) return category;

        category.nombre = name;
        return category;
      }).toList();
      notifyListeners();
    } catch (e) {
      throw 'Erro ao atualizar a categoria ';
    }
  }

  Future delete(String id) async {
    try {
      await CafeApi.delete('/categorias/$id', {});
      categories.removeWhere((category) => category.id == id);

      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
