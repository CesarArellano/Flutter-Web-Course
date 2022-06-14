import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  
  const LoginView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('LoginView', style: GoogleFonts.poppins().copyWith(color: Colors.white)),
    );
  }
}