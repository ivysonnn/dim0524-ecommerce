import 'dart:convert';

import 'package:dim0524_ecommerce/shared/models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static const _keyName = 'name';
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';
  static const _keyLogged = 'isLogged';
  static const _keyCart = 'cart';

  bool isLogged = false;

  Future<void> init() async {
    final preferences = await SharedPreferences.getInstance();
    isLogged = preferences.getBool(_keyLogged) ?? false;
  }

  Future<void> saveCredentials(String name, String email, String password) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_keyName, name);
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
  
  Future<void> saveCart(List<CartItem> items) async {
    final preferences = await SharedPreferences.getInstance();

    List<String> jsonList = items.map((item) => json.encode(item.toJson())).toList();

    await preferences.setStringList(_keyCart, jsonList);
  }

  Future<List<CartItem>> getCart() async {
    final preferences = await SharedPreferences.getInstance();

    List<String>? jsonList = preferences.getStringList(_keyCart);

    if (jsonList == null) return [];

    return jsonList.map((item) => CartItem.fromJson(json.decode(item))).toList();
  }

  Future<void> clearCart() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.remove(_keyCart);
  }
}