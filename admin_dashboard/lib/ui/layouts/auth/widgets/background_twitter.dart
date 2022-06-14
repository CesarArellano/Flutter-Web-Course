import 'package:flutter/material.dart';

class BackgroundTwitter extends StatelessWidget {
  const BackgroundTwitter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildBoxDecoration(),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        width: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Image.asset('assets/twitter-white-logo.png'),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/twitter-bg.png'),
        fit: BoxFit.cover
      )
    );
  }
}