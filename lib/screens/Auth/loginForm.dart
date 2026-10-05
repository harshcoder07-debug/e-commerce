import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/bloc/Authbloc/auth_event.dart' show loginrequest;
import 'package:shopit/widgets/custombutton.dart' show Custombutton;
import 'package:shopit/widgets/textinputfeild.dart';

import '../../bloc/Authbloc/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Textinputfeild(
                showtext: 'Enter Email',
                controller: emailcontroller,
                texticon: Icons.email,
                rowtext: 'Email',
              ),

              const SizedBox(height: 15),

              Textinputfeild(
                showtext: 'Enter Password',
                controller: passwordcontroller,
                texticon: Icons.password,
                rowtext: 'Password',
                forgot: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot?"),
                ),
              ),

              const SizedBox(height: 10),

              Custombutton(
                buttontap: () {
                  context.read<AuthBloc>().add(
                    loginrequest(
                      emailcontroller.text.trim(),
                      passwordcontroller.text,
                    ),
                  );
                },
                buttoncolors: Colors.blue,
                Showtext: 'Login',
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textcolors: Colors.white,
                text: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
