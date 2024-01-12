import 'package:dio/dio.dart';
//dio: ^4.0.6
//https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=ff4d74e2d3b240a3b5c8da83443c00fb
class MyDio {
  static late Dio dio;
  static init() => dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org/",
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  static Future<Response> getData(Map<String, dynamic>? data,{required String endPoint}) async =>
      await dio.get(endPoint, queryParameters:data );

  static Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async =>
      await dio.post(endPoint, data: data);

  static Future<Response> putData({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async =>
      await dio.put(endPoint, data: data);

  static Future<Response> delData({
    required String endPoint,
    // required Map<String, dynamic> data,
  }) async =>
      await dio.delete(endPoint);
}