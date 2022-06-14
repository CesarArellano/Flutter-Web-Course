import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  
  const AuthLayout({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          // Desktop
          _DesktopBody()
          // Mobile
          // LinksBar
        ],
      )
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.black,
      child: Row(
        children: [
          // Twitter Background
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),

          const SizedBox(
            width: 600,
            height: double.infinity,
          )
        ],
      ),
    );
  }
}