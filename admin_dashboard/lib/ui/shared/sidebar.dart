import 'package:flutter/material.dart';

import 'widgets/logo.dart';
import 'widgets/text_separator.dart';
import 'widgets/custom_menu_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      decoration: _buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50),
          const TextSeparator( text: 'Main'),
          CustomMenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration,
            isActive: false,
            onPressed: () {

            }
          )
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[
          Color( 0xff092044),
          Color( 0xff092042),
        ]
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10
        )
      ]
    );
  }
}