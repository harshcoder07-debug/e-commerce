import 'package:flutter/material.dart';
import 'package:shopit/widgets/custombutton.dart';
import 'package:shopit/widgets/textinputfeild.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Textinputfeild(
          showtext: 'Enter Email',
          controller: _emailcontroller,
          texticon: Icons.email,
          rowtext: 'Email',
        ),
        SizedBox(height: 18),
        Textinputfeild(
          showtext: 'Enter Password',
          controller: _passwordcontroller,
          texticon: Icons.password,
          rowtext: 'Password',
          forgot: TextButton(onPressed: () {}, child: Text("Forgot?")),
        ),
        SizedBox(height: 10),
        Custombutton(
          buttontap: () {},
          buttoncolors: Colors.blue,
          Showtext: 'Login',
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textcolors: Colors.white,
          text: 'Login',
        ),
      ],
    );
  }
}
