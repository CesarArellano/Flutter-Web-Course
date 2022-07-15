import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardLayout extends StatelessWidget {
  
  const DashboardLayout({
    Key? key,
    required this.child
  }) : super(key: key);
  
  final Widget child;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Dashboard', style: GoogleFonts.poppins().copyWith(fontSize: 50)),
            Expanded(child: child)
          ],
        ),
      )
    );
  }
}