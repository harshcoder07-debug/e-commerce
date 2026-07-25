import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/bloc/bloc/auth_bloc.dart';
import 'package:shopit/bloc/bloc/auth_state.dart';
import 'package:shopit/screens/Auth/Signupform.dart';
import 'package:shopit/screens/Auth/loginForm.dart';
import 'package:shopit/widgets/Authtoogle.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final islogin = state is LoginState;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  const Text(
                    "Merchant",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Text(
                        islogin ? "Welcome Back" : "Create Account",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const AuthToggle(),

                  const SizedBox(height: 30),

                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: islogin
                          ? LoginForm(key: ValueKey("login"))
                          : const RegisterForm(key: ValueKey("register")),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
