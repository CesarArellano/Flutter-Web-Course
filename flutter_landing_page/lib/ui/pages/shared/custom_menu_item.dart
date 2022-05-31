import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  const CustomMenuItem({
    Key? key,
    required this.text,
    required this.onPressed,
    this.delay = 0,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final int delay;

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: Duration(milliseconds: widget.delay),
      from: 10,
      child: MouseRegion(
        onEnter: ( _ ) => setState(() => isHover = true),
        onExit: ( _ ) => setState(() => isHover = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 150,
            height: 45,
            color: (isHover) ? Colors.pinkAccent : Colors.transparent,
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
    
      ),
    );
  }
}