import 'package:dashboard_/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static Dio _dio = new Dio();

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
    print("vindo do formularip $data");
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);

      return resp.data;
    } catch (e) {
      throw ("Error no POST");
    }
  }
}
