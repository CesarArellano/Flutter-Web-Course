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
            icon: Icons.compass_calibration_outlined,
            isActive: false,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Orders',
            icon: Icons.shopping_cart_outlined,
            isActive: false,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Analytic',
            icon: Icons.show_chart_outlined,
            isActive: false,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Categories',
            icon: Icons.layers_outlined,
            isActive: false,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Products',
            icon: Icons.dashboard_outlined,
            isActive: false,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Discount',
            icon: Icons.attach_money_outlined,
            isActive: false,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Customers',
            icon: Icons.people_alt_outlined,
            isActive: false,
            onPressed: () {
            }
          ),
          const SizedBox(height: 30),
          const TextSeparator( text: 'UI Elements'),
          CustomMenuItem(
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            isActive: false,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            isActive: false,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Campaing',
            icon: Icons.note_add_outlined,
            isActive: false,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Black',
            icon: Icons.post_add_outlined,
            isActive: false,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Logout',
            icon: Icons.exit_to_app_outlined,
            isActive: false,
            onPressed: () {
            }
          ),
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