import 'package:flutter/material.dart';

class Textinputfeild extends StatelessWidget {
  final String showtext;
  final IconData texticon;
  final String rowtext;
  final Widget?
  forgot; // Changed to Widget? to accept TextButton or IconButton flexibly
  final TextEditingController controller;
  final bool isPassword; // Added to handle hiding password characters

  const Textinputfeild({
    super.key,
    required this.showtext,
    required this.controller,
    required this.texticon,
    required this.rowtext,
    this.forgot,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rowtext,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              ?forgot,
            ],
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            suffixIcon: Icon(texticon),
            labelText: showtext,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 0.5),
            ),
          ),
        ),
      ],
    );
  }
}
