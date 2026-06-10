import 'package:dim0524_ecommerce/features/auth/data/user_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButton extends StatelessWidget {
  final Color btnColor;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLoginFailed;
  const LoginButton({super.key, required this.btnColor, required this.formKey, required this.emailController, required this.passwordController, required this.onLoginFailed});

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
            bool succesfullyLogged = await Get.find<UserHandler>().login(emailController.text, passwordController.text);
            if(succesfullyLogged) {
              Get.offAllNamed('/home');
            } else {
              onLoginFailed();
            }
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