import 'dart:developer';

import 'package:admin_dashboard/extensions/null_extensions.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  
  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    // Peticion HTTP
    _token = 'asdfghjklñqwertyuiop';
    LocalStorage.prefs.setString('token', _token.valueEmpty('') );
    authStatus = AuthStatus.authenticated;
    log('Store JWT: $_token, $email, $password');
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if( token == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    await Future.delayed(const Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}