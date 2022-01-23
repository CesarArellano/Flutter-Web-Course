import 'package:flutter/material.dart';
import 'package:web_bases/ui/shared/custom_app_menu.dart';

class MainLayoutPage extends StatelessWidget {
  
  final Widget child;

  const MainLayoutPage({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppMenu(),
          const Spacer(),
          Expanded(child: child),
          const Spacer(),
        ],
      ),
    );
  }
}