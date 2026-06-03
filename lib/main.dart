import 'package:dim0524_ecommerce/features/auth/core/utils/middleware.dart';
import 'package:dim0524_ecommerce/features/auth/data/auth_handler.dart';
import 'package:dim0524_ecommerce/features/auth/presentation/pages/login_page.dart';
import 'package:dim0524_ecommerce/features/home/presentation/pages/home_page.dart';
import 'package:dim0524_ecommerce/shared/data/product_hadler.dart';
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

  final AuthHandler authHandler = AuthHandler();
  await authHandler.init();
  final ProductHandler productHandler = ProductHandler();

  Get.put(authHandler);
  Get.put(productHandler);

  final isLogged = Get.find<AuthHandler>().isLogged;
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
          page: () => LoginPage(authHandler: Get.find()),
        ),
        GetPage(
          name: '/home', 
          page: () => HomePage(
            authHandler: Get.find(), 
            productHandler: Get.find(),),
          middlewares: [AuthMiddleware()],
        ),
      ],
    );
  }
}

