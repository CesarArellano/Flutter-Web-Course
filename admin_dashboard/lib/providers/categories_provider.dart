import 'package:flutter/material.dart';

import '../api/cafe_api.dart';
import '../models/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  
  List<Categoria> categories = [];

  getCategories() async{
    final json = await CafeApi.httpGet('/categorias');
    final categoriesResp = CategoriesResponse.fromJson(json);
    categories = [ ...(categoriesResp.categorias ?? []) ];
    notifyListeners();
  }
}