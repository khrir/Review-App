import 'package:flutter/material.dart';

TextField customTextField(
    String hintText, TextEditingController controller, bool obscureText) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      focusColor: Colors.white,
      hintText: hintText,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      hintStyle: const TextStyle(
        color: Colors.black54,
      ),
      isDense: true,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
  );
}
