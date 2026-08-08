import 'package:dio/dio.dart';
import 'package:papacapim/core/api/api_client.dart';

class AuthService {
  Future<void> register({
    required String login,
    required String name,
    required String password,
    required String passwordConfirmation,
  }) async {
    try{
      await ApiClient.dio.post(
        "/users",
        data: {
          "login": login,
          "name": name,
          "password": password,
          "password_confirmation": passwordConfirmation
        }
      );
    }on DioException catch (e){
       throw Exception(
        e.response?.data['message'] ?? 'Erro ao criar usuário',
      );
    }
  }
}