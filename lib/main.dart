import 'package:dim0524_ecommerce/features/auth/core/utils/middleware.dart';
import 'package:dim0524_ecommerce/shared/data/auth_preference.dart';
import 'package:dim0524_ecommerce/features/auth/data/user_handler.dart';
import 'package:dim0524_ecommerce/features/auth/presentation/pages/login_page.dart';
import 'package:dim0524_ecommerce/features/cart/data/cart_controller.dart';
import 'package:dim0524_ecommerce/features/cart/presentation/pages/cart_page.dart';
import 'package:dim0524_ecommerce/features/home/presentation/pages/home_page.dart';
import 'package:dim0524_ecommerce/shared/data/product_handler.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  final Preference preferences = Preference();
  await preferences.init();
  Get.put(preferences);

  final ProductHandler productHandler = ProductHandler();
  final UserHandler userHandler = UserHandler();
  final CartController cartController = CartController();
  Get.put(productHandler);
  Get.put(userHandler);
  Get.put(cartController);

  final isLogged = Get.find<Preference>().isLogged;
  runApp(MyApp(isLogged: isLogged,));
}

class MyApp extends StatelessWidget {
  final bool isLogged;

  const MyApp({super.key, required this.isLogged});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Louja',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: isLogged ? '/home' : '/login',
      getPages: [
        GetPage(
          name: '/login', 
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/home', 
          page: () => HomePage(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(
          name: '/cart', 
          page: () => CartPage(),
          middlewares: [AuthMiddleware()],
        ),
      ],
    );
  }
}

