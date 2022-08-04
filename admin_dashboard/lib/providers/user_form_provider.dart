import 'dart:developer';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:flutter/material.dart';

import '../models/auth_response.dart';

class UserFormProvider extends ChangeNotifier {
  
  Usuario? user;
  late GlobalKey<FormState> formKey;

  bool validForm() {
    return formKey.currentState!.validate();
  }
  
  Future<bool> updateUser() async {
    final data = {
      'nombre': user?.nombre,
      'correo': user?.correo
    };

    try {
      final json = await CafeApi.httpPut('/usuarios/${ user?.uid }', data);
      Usuario.fromJson(json);
      notifyListeners();
      return true;
      
    } catch (e) {
      log(e.toString());
      return false;
    }
    
  }
}