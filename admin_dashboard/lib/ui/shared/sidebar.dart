import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/side_menu_provider.dart';
import 'widgets/custom_menu_item.dart';
import 'widgets/logo.dart';
import 'widgets/text_separator.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);
  
  void navigateTo( String routeName ) {
    NavigationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
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
            isActive: sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
            onPressed: () => navigateTo(Flurorouter.dashboardRoute)
          ),
          CustomMenuItem(
            text: 'Orders',
            icon: Icons.shopping_cart_outlined,
            onPressed: () => SideMenuProvider.closeMenu(),
          ),
          CustomMenuItem(
            text: 'Analytic',
            icon: Icons.show_chart_outlined,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Categories',
            icon: Icons.layers_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.categoriesRoute,
            onPressed: () => navigateTo(Flurorouter.categoriesRoute)
          ),
          CustomMenuItem(
            text: 'Products',
            icon: Icons.dashboard_outlined,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Discount',
            icon: Icons.attach_money_outlined,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Users',
            icon: Icons.people_alt_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.usersRoute,
            onPressed: () => navigateTo(Flurorouter.usersRoute)
          ),
          const SizedBox(height: 30),
          const TextSeparator( text: 'UI Elements'),
          CustomMenuItem(
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
            onPressed: () => navigateTo(Flurorouter.iconsRoute)
          ),
          CustomMenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Campaing',
            icon: Icons.note_add_outlined,
            onPressed: () {
            }
          ),
          CustomMenuItem(
            text: 'Blank',
            icon: Icons.post_add_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
            onPressed: () => navigateTo(Flurorouter.blankRoute)
          ),
          const SizedBox(height: 50),
          const TextSeparator( text: 'Exit'),
          CustomMenuItem(
            text: 'Logout',
            icon: Icons.exit_to_app_outlined,
            isActive: false,
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
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