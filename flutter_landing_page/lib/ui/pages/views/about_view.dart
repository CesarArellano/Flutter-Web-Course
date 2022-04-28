import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {
  
  const AboutView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FittedBox(
            child: Text(
              'About',
              style: GoogleFonts.poppins(
                fontSize: 80,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}