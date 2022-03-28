import 'package:flutter/material.dart';

import 'package:web_bases/locator.dart';
import 'package:web_bases/services/navigation_service.dart';

import 'package:web_bases/ui/shared/custom_flat_button.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ( _, BoxConstraints constraints) {
        return ( constraints.maxWidth > 768 )
          ? const _TableDesktopMenu()
          : const _MobileMenu();
      },
    );
  }
}

class _MobileMenu extends StatelessWidget {
  const _MobileMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFlatButton(
            color: Colors.black,
            text: 'Contador Stateful',
            onPressed: () => locator<NavigationService>().navigateTo('/stateful'),
          ),

          const SizedBox(width: 10),
          
          CustomFlatButton(
            color: Colors.black,
            text: 'Contador Provider',
            onPressed: () => locator<NavigationService>().navigateTo('/provider'),
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            color: Colors.black,
            text: 'Otra página',
            onPressed: () => locator<NavigationService>().navigateTo('/ABC'),
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            color: Colors.black,
            text: 'Stateful 15',
            onPressed: () => locator<NavigationService>().navigateTo('/stateful/15'),
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            color: Colors.black,
            text: 'Provider 200',
            onPressed: () => locator<NavigationService>().navigateTo('/provider?q=200'),
          ),
        ],
      ),
    );
  }
}

class _TableDesktopMenu extends StatelessWidget {
  const _TableDesktopMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          CustomFlatButton(
            color: Colors.black,
            text: 'Contador Stateful',
            onPressed: () => locator<NavigationService>().navigateTo('/stateful'),
          ),

          const SizedBox(width: 10),
          
          CustomFlatButton(
            color: Colors.black,
            text: 'Contador Provider',
            onPressed: () => locator<NavigationService>().navigateTo('/provider'),
          ),

          const SizedBox(width: 10),
          CustomFlatButton(
            color: Colors.black,
            text: 'Otra página',
            onPressed: () => locator<NavigationService>().navigateTo('/ABC'),
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            color: Colors.black,
            text: 'Stateful 15',
            onPressed: () => locator<NavigationService>().navigateTo('/stateful/15'),
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            color: Colors.black,
            text: 'Provider 200',
            onPressed: () => locator<NavigationService>().navigateTo('/provider?q=200'),
          ),
        ],
      ),
    );
  }
}

