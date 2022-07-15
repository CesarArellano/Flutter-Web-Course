

import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  bool _showPassword = true;

  bool get showPassword => _showPassword;

  set showPassword(bool value) {
    _showPassword = value;
    notifyListeners();
  }

  bool validateForm() {
    if( !formKey.currentState!.validate() ) return false;
    return true;
  }
  
}