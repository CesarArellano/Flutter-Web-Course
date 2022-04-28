import 'package:flutter/material.dart';

import 'package:flutter_landing_page/ui/pages/shared/custom_app_menu.dart';

import 'package:flutter_landing_page/ui/pages/views/about_view.dart';
import 'package:flutter_landing_page/ui/pages/views/contact_view.dart';
import 'package:flutter_landing_page/ui/pages/views/home_view.dart';
import 'package:flutter_landing_page/ui/pages/views/location_view.dart';
import 'package:flutter_landing_page/ui/pages/views/pricing_view.dart';

class HomePage extends StatelessWidget {
  
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          _HomeBody(),
          Positioned(
            right: 20,
            top: 20,
            child: CustomAppMenu()
          ),
        ],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        AboutView(),
        PrincingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}