import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashLayout extends StatelessWidget {
  
  const SplashLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 75,
              width: 75,
              child: CircularProgressIndicator()
            ),
            const SizedBox(height: 20),
            Text(
              'Checking',
              style: GoogleFonts.poppins().copyWith(fontSize: 30),
            ),
          ],
        )
      )
    );
  }
}