import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:flutter/material.dart';

import '../../shared/navbar.dart';
import '../../shared/sidebar.dart';

class DashboardLayout extends StatefulWidget {
  
  const DashboardLayout({
    Key? key,
    required this.child
  }) : super(key: key);
  
  final Widget child;

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    SideMenuProvider.menuController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              if( size.width > 700)
                const Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    const NavBar(),
                    Expanded(
                      child: widget.child
                    ),
                  ],
                ),
              ),
            ],
          ),
          if( size.width <= 700)
            AnimatedBuilder(
              animation: SideMenuProvider.menuController,
              builder: (context, child) {
                return Stack(
                  children: [
                    if( SideMenuProvider.isOpen )
                      AnimatedOpacity(
                        opacity: SideMenuProvider.opacity.value,
                        duration: const Duration(milliseconds: 200),
                        child: GestureDetector(
                          onTap: () => SideMenuProvider.closeMenu(),
                          child: Container(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    Transform.translate(
                      offset: Offset(SideMenuProvider.movement.value, 0),
                      child: const Sidebar()
                    )
                  ],
                );
              },
            )
        ],
      )
    );
  }
}