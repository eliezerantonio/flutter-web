// ignore_for_file: unnecessary_new, file_names

import 'dart:typed_data';

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
    } on DioError catch (e) {
      throw ("Error no GET $e");
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
    // ignore: avoid_print
    print("vindo do formularip $data");
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);

      return resp.data;
    } on DioError catch (e) {
      throw ("Error no POST $e");
    }
  }

  static Future put(String path, Map<String, dynamic> data) async {
    // ignore: avoid_print
    print("vindo do formularip $data");
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);

      return resp.data;
    } on DioError catch (e) {
      throw ("Error no PUT $e");
    }
  }

  static Future delete(String path, Map<String, dynamic> data) async {
    // ignore: avoid_print
    print("vindo do formularip $data");
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.delete(path, data: formData);

      return resp.data;
    } on DioError catch (e) {
      throw ("Error no DELETE $e");
    }
  }

  static Future uploadFile(String path, Uint8List bytes) async {
    // ignore: avoid_print
    final formData =
        FormData.fromMap({'archivo': MultipartFile.fromBytes(bytes)});

    try {
      final resp = await _dio.put(path, data: formData);

      return resp.data;
    } on DioError catch (e) {
      throw ("Error no PUT $e");
    }
  }
}
