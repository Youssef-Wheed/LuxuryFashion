import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.validator,
    this.textInputAction = TextInputAction.next,
  });

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      textInputAction: textInputAction,
      cursorColor: Colors.black,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontFamily: "TenorSans",
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF757575),
          fontSize: 15,
          fontFamily: "TenorSans",
          letterSpacing: 0.5,
        ),
        errorStyle: const TextStyle(
          fontSize: 12,
          fontFamily: "TenorSans",
          color: Colors.red,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 22),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFD4D4D4)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
