import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../services/local_storage.dart';

class CafeApi {
  
  static final Dio _dio = Dio();

  static void configureDio() {
    // Base URL
    _dio.options.baseUrl = 'https://flutter-web-admin-rwd.herokuapp.com/api';

    // Configure Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? '',
    };

  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } on DioError {
      return null;
    }
  }

  static Future<dynamic> httpPost(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.post( path, data: formData );
      return resp.data;
    } on DioError catch (e) {
      log(e.response.toString());
      return null;
    }
  }

  static Future<dynamic> httpPut(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.put( path, data: formData );
      return resp.data;
    } on DioError catch (e) {
      log(e.response.toString());
      return null;
    }
  }

  static Future<dynamic> uploadFile(String path, Uint8List bytes) async {
    final formData = FormData.fromMap({
      'archivo': MultipartFile.fromBytes(bytes)
    });
    try {
      final resp = await _dio.put( path, data: formData );
      return resp.data;
    } on DioError catch (e) {
      log(e.response.toString());
      return null;
    }
  }
}