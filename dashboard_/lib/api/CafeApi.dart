// ignore_for_file: unnecessary_new, file_names

import 'package:dashboard_/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static final Dio _dio = new Dio();

  static void configureDio() {
    //base da url

    _dio.options.baseUrl = 'http://localhost:8080/api';
    //Configurar headers

    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);

      return resp.data;
    } catch (e) {
      throw ("Error no GET");
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
    // ignore: avoid_print
    print("vindo do formularip $data");
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);

      return resp.data;
    } catch (e) {
      throw ("Error no POST");
    }
  }

  static Future put(String path, Map<String, dynamic> data) async {
    // ignore: avoid_print
    print("vindo do formularip $data");
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);

      return resp.data;
    } catch (e) {
      throw ("Error no PUT");
    }
  }

  static Future delete(String path, Map<String, dynamic> data) async {
    // ignore: avoid_print
    print("vindo do formularip $data");
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.delete(path, data: formData);

      return resp.data;
    } catch (e) {
      throw ("Error no DELETE");
    }
  }
}
