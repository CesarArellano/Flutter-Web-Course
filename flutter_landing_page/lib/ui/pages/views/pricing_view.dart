import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrincingView extends StatelessWidget {
  
  const PrincingView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FittedBox(
            child: Text(
              'Pricing',
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