import 'package:flutter/material.dart';

class STextFiled extends StatelessWidget {
  final String textHint;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool obscureText;

  const STextFiled({
    Key? key,
    required this.textHint,
    this.controller,
    this.inputType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: textHint,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
