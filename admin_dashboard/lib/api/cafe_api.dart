import 'dart:developer';

import 'package:dio/dio.dart';

import '../services/local_storage.dart';

class CafeApi {
  
  static final Dio _dio = Dio();

  static void configureDio() {
    // Base URL
    _dio.options.baseUrl = 'http://localhost:8080/api';

    // Configure Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? '',
    };

  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } catch (e) {
      log(e.toString());
      throw('Error in GET REQUEST');
    }
  }

  static Future<dynamic> httpPost(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      log('URL: ${ _dio.options.baseUrl }$path, data: $data ');
      final resp = await _dio.post( path, data: formData ).catchError((error) {
        log(error);
      });
      return resp.data;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}