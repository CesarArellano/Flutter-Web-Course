import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkText extends StatefulWidget {
  const LinkText({
    Key? key,
    required this.text,
    this.onPressed
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        onEnter: ( _ ) => setState((() => isHover = true)),
        onExit: ( _ ) => setState((() => isHover = false)),
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            widget.text,
            style: GoogleFonts.poppins().copyWith(
              color: Colors.grey[700],
              fontSize: 16,
              decoration: isHover ? TextDecoration.underline : TextDecoration.none
          )),
        ),
      ),
    );
  }
}