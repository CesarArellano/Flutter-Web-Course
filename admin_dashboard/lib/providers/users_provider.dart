import 'dart:developer';

import 'package:admin_dashboard/models/user_response.dart';
import 'package:flutter/material.dart';

import '../api/cafe_api.dart';
import '../models/auth_response.dart';

class UsersProvider extends ChangeNotifier {
  
  List<Usuario> users = [];
  bool isLoading = false;
  bool ascending = false;
  int? sortColumnIndex;

  UsersProvider() {
    getPaginatedUsers();
  }

  Future<void> getPaginatedUsers() async {
    isLoading = true;
    notifyListeners();
    final json = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResp = UserResponse.fromJson(json);
    users = [ ...(usersResp.usuarios ?? []) ];
    isLoading = false;
    notifyListeners();
  }

  Future<Usuario?> getUserById(String uid) async {
    try {
      final json = await CafeApi.httpGet('/usuarios/$uid');
      log('getUserById: $json');
      if( json == null ) return null;
      final userResp = Usuario.fromJson(json);
      return userResp;
      
    } catch (e) {
      log(e.toString());
      return null;
    }    
  }

  void refreshUser(Usuario user) {
    users = users.map((e) {
      if( e.uid == user.uid) return user;
      return e;
    }).toList();

    notifyListeners();
  }
  // Future<void> removeCategory(String id) async {
  //   final json = await CafeApi.httpGet('/categorias/$id');
  //   if( json == null ) return;
  //   categories.removeWhere((item) => item.id == id);
  //   notifyListeners();
  // }

  void sort<T>( Comparable<T> Function( Usuario user) getField ) {
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
        ? Comparable.compare(aValue, bValue)
        : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;
    notifyListeners();
  }
}