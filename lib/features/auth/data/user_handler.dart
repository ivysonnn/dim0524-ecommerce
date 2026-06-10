import 'dart:convert';
import 'dart:io';

import 'package:dim0524_ecommerce/shared/data/auth_preference.dart';
import 'package:dim0524_ecommerce/features/auth/domain/model/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserHandler {
  static const String _baseUrl = "https://fakestoreapi.com";

  Future<List<User>> _getAllUsers() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/users'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => User.fromJson(json)).toList(); 
      } else {
        throw Exception('Error when getting the products: $response.statusCode');
      }
    } on SocketException {
      throw Exception("Sem conexão com a internet");
    }
  }

  Future<User?> _getUserByEmail(String email) async {
    List<User> users = await _getAllUsers();

    for (var user in users) {
      if(user.email == email) return user;
    }

    return null;
  }

  Future<bool> login(String email, String password) async {
    final User? user = await _getUserByEmail(email);

    if (user != null && user.password == password) {
      Get.find<Preference>().saveCredentials(user.name, email, password);
      return true;
    }

    return false;
  } 
}