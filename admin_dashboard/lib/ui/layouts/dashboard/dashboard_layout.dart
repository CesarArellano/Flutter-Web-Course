import 'package:flutter/material.dart';

import '../../shared/sidebar.dart';

class DashboardLayout extends StatelessWidget {
  
  const DashboardLayout({
    Key? key,
    required this.child
  }) : super(key: key);
  
  final Widget child;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFEDF1F2),
      body: Row(
        children: [
          // TODO: This depends on whether the screen is large than 700 px
          const Sidebar(),
          Expanded(child: child),
        ],
      )
    );
  }
}