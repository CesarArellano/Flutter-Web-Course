import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:flutter/material.dart';

import 'widgets/search_text.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: _buildBoxDecoration(),
      child: Row(
        children: [
          const SizedBox(width: 5),
          if( size.width <= 700 )
            Material(
              child: IconButton(
                icon: const Icon(Icons.menu_outlined),
                onPressed: () => SideMenuProvider.openMenu(),
                splashRadius: 20,
              ),
            ),
          const SizedBox(width: 5),
          if( size.width > 400 )
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const SearchText(),
            ),
          const Spacer(),
          const _NotificationIndicator(),
          const SizedBox(width: 5),
          ClipOval(
            child: Image.network(
              'https://th.bing.com/th/id/R.42c4d08885da7d7e25b043ef0a6a209c?rik=a5iCH%2b2wUYvgcw&pid=ImgRaw&r=0',
              width: 35,
              height: 35,
            ),
          ),
          const SizedBox(width: 5),
        ],
      )
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10
        )
      ]
    );
  }
}

class _NotificationIndicator extends StatelessWidget {
  const _NotificationIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          child: IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: (){},
            splashRadius: 20,
          ),
        ),
        Positioned(
          left: 6,
          top: 10,
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(100)
            ),
          ),
        )
      ],
    );
  }
}