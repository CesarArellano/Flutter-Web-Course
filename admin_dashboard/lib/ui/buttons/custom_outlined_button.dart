import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.text,
    this.textStyle,
    this.onPressed,
    this.minWidth,
    this.color = Colors.black,
    this.borderColor = Colors.blue

  }) : super(key: key);

  final VoidCallback? onPressed;
  final double? minWidth;
  final Color color;
  final Color borderColor;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      splashColor: Colors.white10,
      height: 50,
      shape: StadiumBorder(side: BorderSide(color: borderColor)),
      color: color,
      onPressed: onPressed,
      child: Text(text, style: textStyle),
    );
  }
}