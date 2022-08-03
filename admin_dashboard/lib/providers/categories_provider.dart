import 'package:flutter/material.dart';

import '../api/cafe_api.dart';
import '../models/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  
  List<Categoria> categories = [];

  Future<void> getCategories() async {
    final json = await CafeApi.httpGet('/categorias');
    final categoriesResp = CategoriesResponse.fromJson(json);
    categories = [ ...(categoriesResp.categorias ?? []) ];
    notifyListeners();
  }

  Future<void> addCategory(String name) async {
    final data = {
      'nombre': name,
    };
    final json = await CafeApi.httpPost('/categorias', data);
    final categoryResp = Categoria.fromJson(json);
    categories = [ ...categories, categoryResp ];
    notifyListeners();
  }

  Future<void> removeCategory(String id) async {
    final json = await CafeApi.httpGet('/categorias/$id');
    if( json == null ) return;
    categories.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  Future<void> updateCategory(String id, String name) async {
    final data = {
      'nombre': name,
    };
    await CafeApi.httpPut('/categorias/$id', data);
    categories = categories.map((category) {
      if( category.id != id ) return category;
      category.nombre = name;
      return category;
    }).toList();
    notifyListeners();
  }
}