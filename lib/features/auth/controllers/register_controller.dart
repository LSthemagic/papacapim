import 'package:flutter/material.dart';
import 'package:papacapim/features/auth/services/auth_service.dart';

class RegisterController extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;
  String? error;

  Future<bool> register({
    required String login,
    required String name,
    required String password,
    required String passwordConfirmation,
  }) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      
      await _authService.register(
        login: login,
        name: name,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      return true;
    } catch (e) {
      error = e.toString();
      print(error);
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
