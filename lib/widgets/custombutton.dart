import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final VoidCallback buttontap;
  final Color buttoncolors;
  final String text;
  final Color textColor;

  const Custombutton({
    super.key,
    required this.buttontap,
    required this.buttoncolors,
    required this.text,
    this.textColor = Colors.white,
    required Color textcolors,
    required TextStyle textStyle,
    required String Showtext,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontap,
      child: Container(
        decoration: BoxDecoration(
          color: buttoncolors,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 60,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
