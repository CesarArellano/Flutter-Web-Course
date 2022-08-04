import 'dart:developer';
import 'dart:typed_data';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:flutter/material.dart';

import '../models/auth_response.dart';

class UserFormProvider extends ChangeNotifier {
  
  Usuario? user;
  bool isLoadingImage = false;
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

  Future<Usuario?> uploadImage(String path, Uint8List bytes) async {
    try {
      isLoadingImage = true; 
      notifyListeners();
      final json = await CafeApi.uploadFile(path, bytes);
      user = Usuario.fromJson(json);
      isLoadingImage = false;
      notifyListeners();
      return user;
      
    } catch (e) {
      log(e.toString());
      isLoadingImage = false;
      notifyListeners();
      return null;
    }
  }
}