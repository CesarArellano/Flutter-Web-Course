import 'package:flutter/material.dart';

import 'package:web_bases/locator.dart';
import 'package:web_bases/services/navigation_service.dart';

import 'package:web_bases/ui/shared/custom_flat_button.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

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
        ],
      ),
    );
  }
}