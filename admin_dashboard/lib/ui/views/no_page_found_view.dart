import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageFoundView extends StatelessWidget {
  
  const NoPageFoundView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '404 - Page Not Found',
          style: GoogleFonts.poppins(
            fontSize: 50,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}