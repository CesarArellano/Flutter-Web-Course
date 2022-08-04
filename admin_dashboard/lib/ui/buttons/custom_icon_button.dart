import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.color = Colors.blue,
    this.isFilled = false,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      shape: const StadiumBorder(),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 5,),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      )
    );
  }
}