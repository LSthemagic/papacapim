import 'package:dio/dio.dart';
import 'package:papacapim/core/api/api_client.dart';

class AuthService {

  String parseErrors(dynamic data) {
  if (data is Map) {
    return data.entries
        .map((e) => '${e.key}: ${(e.value as List).join(', ')}')
        .join('\n');
  }

  return data.toString();
}

  Future<void> register({
    required String login,
    required String name,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      await ApiClient.dio.post(
        "/users",
        data: {
          "login": login,
          "name": name,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );
    } on DioException catch (e) {
      print(e.response);
      throw Exception(parseErrors(e.response?.data));
    }
  }
}
