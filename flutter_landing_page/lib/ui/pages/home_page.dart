import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/page_provider.dart';
import 'shared/custom_app_menu.dart';
import 'views/about_view.dart';
import 'views/contact_view.dart';
import 'views/home_view.dart';
import 'views/location_view.dart';
import 'views/pricing_view.dart';

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
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return PageView(
      controller: pageProvider.scrollController,
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