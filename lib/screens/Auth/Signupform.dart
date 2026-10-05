import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopit/bloc/Authbloc/auth_bloc.dart';
import 'package:shopit/bloc/Authbloc/auth_event.dart';
import 'package:shopit/bloc/Authbloc/auth_state.dart';
import 'package:shopit/widgets/custombutton.dart';
import 'package:shopit/widgets/textinputfeild.dart';

class registerform extends StatefulWidget {
  const registerform({super.key});

  @override
  State<registerform> createState() => _registerformState();
}

class _registerformState extends State<registerform> {
  final TextEditingController emailcontroller =
      TextEditingController();

  final TextEditingController passwordcontroller =
      TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is registerfailed) {
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
                  borderRadius:
                      BorderRadius.circular(20),
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            state.message,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: const [
                SizedBox.shrink(),
              ],
            ),
          );

          Future.delayed(
            const Duration(milliseconds: 1500),
            () {
              if (context.mounted) {
                ScaffoldMessenger.of(context)
                    .clearMaterialBanners();
              }
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Textinputfeild(
              showtext: 'Enter Email',
              controller: emailcontroller,
              texticon: Icons.email,
              rowtext: 'Email',
            ),

            const SizedBox(height: 10),

            Textinputfeild(
              showtext: 'Enter Password',
              controller: passwordcontroller,
              texticon: Icons.lock,
              rowtext: 'Password',
            ),

            const SizedBox(height: 20),

            Custombutton(
              buttontap: () {
                final email =
                    emailcontroller.text.trim();

                final password =
                    passwordcontroller.text.trim();

                if (email.isEmpty ||
                    password.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please enter email and password',
                      ),
                    ),
                  );
                  return;
                }

                context.read<AuthBloc>().add(
                  Acccreaterequest(
                    email,
                    password,
                  ),
                );
              },
              buttoncolors: Colors.blue,
              text: 'SignUp',
              textcolors: Colors.white,
              textStyle: const TextStyle(
                fontSize: 16,
              ),
              Showtext: 'Signup',
            ),
          ],
        ),
      ),
    );
  }
}