import 'package:flutter/material.dart';

class SignupTextfield extends StatelessWidget {
  SignupTextfield(
      {required this.label, required this.isPW, required this.onPressed});

  final String label;
  final bool isPW;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: isPW,
        style: TextStyle(fontSize: 17.0),
        decoration: InputDecoration(
            isDense: true,
            hintText: label,
            hintStyle: TextStyle(
                color: Color.fromRGBO(140, 140, 140, 1),
                height: 1.0,
                fontSize: 17.0,
                fontWeight: FontWeight.w500),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                  color: Color.fromRGBO(211, 211, 211, 1), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide:
                  BorderSide(color: Color.fromRGBO(0, 100, 255, 1), width: 3.0),
            )));
  }
}
