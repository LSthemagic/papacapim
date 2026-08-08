import 'package:dio/dio.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.papacapim.just.pro.br",
      headers: {
        'Content-Type': 'application/json',
      }
    )
  );
}