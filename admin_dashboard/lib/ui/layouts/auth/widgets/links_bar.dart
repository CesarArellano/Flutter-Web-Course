import 'package:flutter/material.dart';

import '../../../buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: size.width > 1000 ?  const EdgeInsets.only(top: 5) : null,
      color: Colors.black,
      height: size.width > 1000 ? size.height * 0.075 : null,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: const [
          LinkText( text: 'About'),
          LinkText( text: 'Help Center'),
          LinkText( text: 'Terms of Service'),
          LinkText( text: 'Privacy Policy'),
          LinkText( text: 'Cookie Policy'),
          LinkText( text: 'Ads Info'),
          LinkText( text: 'Blog'),
          LinkText( text: 'Status'),
          LinkText( text: 'Carrers'),
          LinkText( text: 'Brand Resourcers'),
          LinkText( text: 'Advertising'),
          LinkText( text: 'Marketing'),
        ],
      )
    );
  }
}