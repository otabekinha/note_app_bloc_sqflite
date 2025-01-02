import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final TextStyle textFontStyle;
  final TextStyle hintstyle;
  final TextEditingController controller;

  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.hintstyle,
    required this.controller,
    required this.textFontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: textFontStyle,
      controller: controller,
      autofocus: true,
      maxLines: null,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        hintText: hintText,
        hintStyle: hintstyle,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
