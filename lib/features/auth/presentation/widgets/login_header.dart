import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  final Color darkColor, bodyColor;
  const LoginHeader({super.key, required this.darkColor, required this.bodyColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 70,
        ),
        Text("Bem-vindo!",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w800,
            color: darkColor,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text("Entre com suas credenciais para acessar sua conta", 
          style: TextStyle(
            fontSize: 16,
            color: darkColor,
            height: 1.5,
          ),
        ),
      ]
    );
  }
}