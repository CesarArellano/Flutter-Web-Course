import 'dart:developer';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/extensions/null_extensions.dart';
import 'package:admin_dashboard/models/auth_response.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

import '../services/notification_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  Future<void> login(String email, String password) async {
    final data = {
      'correo': email,
      'password': password
    };

    final json = await CafeApi.httpPost('/auth/login', data);
    
    try {
      final authResponse = AuthResponse.fromJson(json);
      user = authResponse.usuario;
      _token = authResponse.token;
      LocalStorage.prefs.setString( 'token', _token.value() );
      authStatus = AuthStatus.authenticated;
      log('Store JWT: $_token, $email, $password');
      notifyListeners();
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
    }catch(e) {
      log(e.toString());
      NotificationService.showSnackBarError('Usuario / Password no válidos');
    }   
  }

  Future<void> register(String name, String email, String password) async {
    // Peticion HTTP
    final data = {
      'nombre': name,
      'correo': email,
      'password': password
    };

    final json = await CafeApi.httpPost('/usuarios', data);
    
    try {
      final authResponse = AuthResponse.fromJson(json);
      user = authResponse.usuario;
      _token = authResponse.token;
      LocalStorage.prefs.setString( 'token', _token.value() );
      authStatus = AuthStatus.authenticated;
      log('Store JWT: $name, $email, $password');
      notifyListeners();
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
    }catch(e) {
      log(e.toString());
      NotificationService.showSnackBarError('Usuario / Password no válidos');
    }   
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if( token == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final json = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromJson(json);
      user = authResponse.usuario;
      _token = authResponse.token;
      LocalStorage.prefs.setString( 'token', _token.value() );
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      log(e.toString());
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  void logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}