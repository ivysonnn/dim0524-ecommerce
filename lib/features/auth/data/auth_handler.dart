import 'package:shared_preferences/shared_preferences.dart';

class AuthHandler {
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';
  static const _keyLogged = 'isLogged';

  bool isLogged = false;

  Future<void> init() async {
    final preferences = await SharedPreferences.getInstance();
    isLogged = preferences.getBool(_keyLogged) ?? false;
  }

  Future<void> saveCredentials(String email, String password) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_keyEmail, email);
    await preferences.setString(_keyPassword, password);
    await preferences.setBool(_keyLogged, true);
    isLogged = true;
  }

  Future<Map<String, String>> getCredentials() async {
    final preferences = await SharedPreferences.getInstance();
    return {
      'email': preferences.getString(_keyEmail) ?? '',
      'password': preferences.getString(_keyPassword) ?? '',
    };
  }

  Future<void> logout() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_keyEmail);
    await preferences.remove(_keyPassword);
    await preferences.remove(_keyLogged);
    isLogged = false;
  }
}