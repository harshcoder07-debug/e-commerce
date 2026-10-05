import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopit/bloc/Authbloc/auth_bloc.dart';
import 'package:shopit/bloc/Authbloc/auth_state.dart';
import 'package:shopit/screens/Auth/Signupform.dart';
import 'package:shopit/screens/Auth/loginForm.dart';
import 'package:shopit/widgets/Authtoogle.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  void showPopup(BuildContext context, String message, bool success) {
    final messenger = ScaffoldMessenger.of(context);

    messenger.clearMaterialBanners();

    messenger.showMaterialBanner(
      MaterialBanner(
        elevation: 0,
        dividerColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        content: Align(
          alignment: Alignment.topCenter,
          child: Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(25),
            color: success
                ? const Color.fromARGB(255, 20, 116, 225)
                : Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    success ? Icons.check_circle_outline : Icons.error_outline,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      message,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
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

    Future.delayed(const Duration(seconds: 2), () {
      messenger.clearMaterialBanners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authfailed) {
          showPopup(context, state.erromessage, false);
        }

        if (state is registerfailed) {
          showPopup(context, state.message, false);
        }

        if (state is Authsucess) {
          showPopup(context, 'Login successful', true);
        }

        if (state is registersuccess) {
          showPopup(context, 'Account created successfully', true);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final bool isSignupView = state is SignupState;

              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 40),

                    const Text(
                      'Merchant',
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
                          isSignupView ? 'Create Account' : 'Welcome Back',
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
                        child: isSignupView
                            ? const registerform()
                            : const LoginForm(),
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
