import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener, BlocBuilder;
import 'package:shopit/bloc/Authbloc/auth_bloc.dart' show AuthBloc;
import 'package:shopit/bloc/Authbloc/auth_state.dart'
    show AuthState, SignupState, Authfailed;
import 'package:shopit/screens/Auth/Signupform.dart' show RegisterForm;
import 'package:shopit/screens/Auth/loginForm.dart' show LoginForm;
import 'package:shopit/widgets/Authtoogle.dart' show AuthToggle;

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, loginfailed) {
        if (loginfailed is Authfailed) {
          ScaffoldMessenger.of(context).clearMaterialBanners();
          ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              backgroundColor: Colors.transparent,
              elevation: 0,
              dividerColor: Colors.transparent,
              content: Align(
                alignment: Alignment.topCenter,
                child: Material(
                  elevation: 6,
                  shadowColor: Colors.black.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 206, 52, 41),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          color: Colors.greenAccent,
                        ),
                        SizedBox(width: 12),
                        Flexible(
                          child: Text(
                            loginfailed.erromessage,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: const [SizedBox.shrink()],
            ),
          );
          Future.delayed(Duration(milliseconds: 1500), () {
            if (context.mounted) {
              ScaffoldMessenger.of(context).clearMaterialBanners();
            }
          });
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final bool isloginview = state is! SignupState;
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
                          isloginview ? "Welcome Back" : "Create Account",
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
                        child: isloginview ? LoginForm() : RegisterForm(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
