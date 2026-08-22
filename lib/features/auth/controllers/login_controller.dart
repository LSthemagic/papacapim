import 'package:flutter/material.dart';
import 'package:papacapim/features/auth/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  final AuthService _authService = AuthService();
    bool isLoading = false;
    String? error;

  Future<bool> login({required String login, required String password}) async {
    isLoading = true;
    notifyListeners();
    try{
      print("controller ${login} - ${password} ");
      final session = await _authService.login(login, password);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', session.token);

      return true;
    }catch (e){
      print(error);
      return false;
    }finally{
      isLoading = false;
    }
  }
}
