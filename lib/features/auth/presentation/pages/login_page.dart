import 'package:dim0524_ecommerce/features/auth/data/auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:dim0524_ecommerce/features/auth/presentation/widgets/login_header.dart';
import 'package:dim0524_ecommerce/features/auth/presentation/widgets/login_form.dart';
import 'package:dim0524_ecommerce/features/auth/presentation/widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  final AuthHandler authHandler;
  const LoginPage({super.key, required this.authHandler});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  // Verde Menta Vibrante (Ideal para botões e destaques no escuro)
  // ── Paleta Modo Claro ──────────────────────

// Teal vibrante para ações e destaques
  final Color _primaryColor = const Color(0xFF0D9488);

// Slate escuro para títulos e cabeçalhos
  final Color _darkTextColor = const Color(0xFF1E293B);

// Slate médio para texto corrido (legível no claro)
  final Color _bodyTextColor = const Color(0xFF64748B);

// Cinza azulado claro para divisórias e outlines
  final Color _borderColor = const Color(0xFFE2E8F0);

// Branco névoa para o fundo da tela
  final Color _bgLight = const Color(0xFFF8FAFC);

// Branco puro para cards e superfícies
  //final Color _surfaceColor = const Color(0xFFFFFFFF);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgLight,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        children: [
                          LoginHeader(darkColor: _darkTextColor, bodyColor: _bodyTextColor),
                          const SizedBox(height: 100,),
                          LoginFormFields(
                            primaryColor: _primaryColor, 
                            darkColor: _darkTextColor, 
                            bodyColor: _bodyTextColor, 
                            borderColor: _borderColor, 
                            emailController: _emailController, 
                            passwordController: _passwordController, 
                            ),
                          const SizedBox(height: 20,),
                          LoginButton(
                            btnColor: _primaryColor,
                            formKey: _formKey, 
                            authHandler: widget.authHandler, 
                            emailController: _emailController,
                            passwordController: _passwordController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
