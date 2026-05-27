import 'package:dim0524_ecommerce/features/home/presentation/pages/home_page.dart';
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
             Navigator.pop(context),
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const HomePage()
              )
            )
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