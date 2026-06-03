import 'package:dim0524_ecommerce/features/auth/data/auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButton extends StatelessWidget {
  final Color btnColor;
  final GlobalKey<FormState> formKey;
  final AuthHandler authHandler;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginButton({super.key, required this.btnColor, required this.formKey, required this.authHandler, required this.emailController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16)
          ),
          elevation: 0,
        ),
        onPressed: ()  async {
          if (formKey.currentState!.validate()) {
            await authHandler.saveCredentials(emailController.text, passwordController.text);
            Get.offAllNamed('/home');
          }
        },
        child: const Text("Entrar",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
    );
  }
}