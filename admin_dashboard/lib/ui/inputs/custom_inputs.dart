
import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration buildInputDecoration({
    required String hintText,
    required String label,
    IconData? icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white30)
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white30)
      ),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      label: Text(label),
      labelStyle: const TextStyle(color: Colors.white),
      prefixIcon: Icon(icon, color: Colors.grey,),
      suffixIcon: suffixIcon,
    );
  }

  static InputDecoration searchInputDecoration({
    required String hintText,
    required IconData? icon,
  }) {
    return InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(icon, color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.grey)
    );
  }

  static InputDecoration buildFormInputDecoration({
    required String hintText,
    required String label,
    IconData? icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey)
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey)
      ),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      label: Text(label),
      prefixIcon: Icon(icon, color: Colors.grey,),
      suffixIcon: suffixIcon,
    );
  }
}