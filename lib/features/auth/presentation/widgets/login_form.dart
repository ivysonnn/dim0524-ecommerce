import 'package:flutter/material.dart';
import 'package:dim0524_ecommerce/features/auth/core/utils/form_validator.dart';

class LoginFormFields extends StatefulWidget {
  final Color primaryColor;
  final Color darkColor;
  final Color bodyColor;
  final Color borderColor;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFormFields({super.key, required this.primaryColor, required this.darkColor, required this.bodyColor, required this.borderColor, required this.emailController, required this.passwordController});

  @override
  State<LoginFormFields> createState() => _LoginFormFieldsState();
}

class _LoginFormFieldsState extends State<LoginFormFields> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label("Email"),
        _inputField(
          Icons.mail_outline_rounded, 
          "Digite seu email", 
          validator: FormValidator.email,
          controller: widget.emailController,
        ),
        const SizedBox(height:16,),
        _label("Senha"),
        _inputField(
          Icons.lock_open_rounded, 
          "Digite sua senha", 
          isPassword: true, 
          suffix: IconButton(
            onPressed:() => {setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            })},
            icon: Icon(_isPasswordVisible ? Icons.visibility_rounded : Icons.visibility_off_rounded)
          ),
          validator: FormValidator.password,
          controller: widget.passwordController,
        )
      ],
    );
  }

  Widget _label(String text) => Padding(
    padding: EdgeInsetsGeometry.only(bottom: 10, left: 4),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: widget.bodyColor,
        letterSpacing: 1.2
      ),
    ), 
  );

  Widget _inputField(IconData icon, String hint, {bool isPassword = false, Widget? suffix, String? Function(String?)? validator, TextEditingController? controller}) {
    return TextFormField(
        obscureText: isPassword && !_isPasswordVisible,
        validator: validator,
        controller: controller,
        style:
        TextStyle(
          color: widget.bodyColor,
          fontWeight: FontWeight.w600,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: hint,
          hintStyle: TextStyle(
            color: widget.bodyColor,
          ),
          prefixIcon: Icon(icon, color: widget.primaryColor,),
          suffixIcon: suffix,
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          errorStyle: TextStyle(
            color: Colors.red.shade700,
            fontSize: 11,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: widget.primaryColor, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: widget.borderColor, width: 1.5)
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.red.shade700,
              width: 1.5,
            )
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.red.shade700,
              width: 1.5,
            )
          ),
          ),
        );
  }
}