import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Color btnColor;
  final GlobalKey<FormState> formKey;
  const LoginButton({super.key, required this.btnColor, required this.formKey});

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
        onPressed: () => {
          if (formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("LOGADO?"))) // so pra fazer alguma coisa
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