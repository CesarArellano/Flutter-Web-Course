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
    )
  );
}