import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton(
      {required this.image,
      required this.text,
      required this.color,
      required this.onPressed});

  final Widget image;
  final Widget text;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [image, text, Opacity(opacity: 0.0, child: image)],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size.fromHeight(50),
          elevation: 1.0,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
