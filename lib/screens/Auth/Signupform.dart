import 'package:flutter/material.dart';
import 'package:shopit/widgets/textinputfeild.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController createAccemail = TextEditingController();
  final TextEditingController createAccpasword = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Column(
        children: [
          Textinputfeild(
            showtext: 'Enter Email',
            controller: createAccemail,
            texticon: Icons.email_rounded,
            rowtext: '',
          ),
        ],
      ),
    );
}
