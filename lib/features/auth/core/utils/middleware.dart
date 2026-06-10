import 'package:dim0524_ecommerce/shared/data/auth_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return Get.find<Preference>().isLogged ? null : const RouteSettings(name: '/login');
  }
}