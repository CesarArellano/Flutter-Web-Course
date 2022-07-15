import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTheme {
  
  static const Color primaryColor = Colors.blueAccent;

  static final lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    splashFactory: kIsWeb ? InkRipple.splashFactory : InkSparkle.splashFactory,
    colorScheme: const ColorScheme.light().copyWith(
      primary: primaryColor,
      onSurface: Colors.white
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor
    ),
    scrollbarTheme: const ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all( Colors.grey[400] )
    )
  );

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
}