import 'package:flutter/material.dart';
import 'package:web_bases/ui/shared/custom_app_menu.dart';

class MainLayoutPage extends StatelessWidget {
  const MainLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomAppMenu(),
          Spacer(),
          // TODO: View
          Spacer(),
        ],
      ),
    );
  }
}