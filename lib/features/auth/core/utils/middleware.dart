import 'package:dim0524_ecommerce/features/auth/data/auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return Get.find<AuthHandler>().isLogged ? null : const RouteSettings(name: '/login');
  }
}