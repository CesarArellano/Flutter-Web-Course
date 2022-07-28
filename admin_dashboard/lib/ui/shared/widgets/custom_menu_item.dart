import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  const CustomMenuItem({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.isActive = false,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isActive;
  final IconData icon;

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: isHovered
        ? Colors.white.withOpacity(0.1)
        : widget.isActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
      duration: const Duration(milliseconds: 250),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.isActive ? null : widget.onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Icon(widget.icon, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    widget.text,
                    style: GoogleFonts.poppins().copyWith(color: Colors.white, fontSize: 16),
                  )
                ]
              ),
            ),
          ),
        ),
      )
    );
  }
}