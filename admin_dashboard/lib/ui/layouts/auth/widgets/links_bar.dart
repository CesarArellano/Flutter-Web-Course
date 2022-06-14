import 'package:flutter/material.dart';

import '../../../buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height: size.height * 0.075,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText( text: 'About', onPressed: () => print('Hello'),),
          const LinkText( text: 'Help Center'),
          const LinkText( text: 'Terms of Service'),
          const LinkText( text: 'Privacy Policy'),
          const LinkText( text: 'Cookie Policy'),
          const LinkText( text: 'Ads Info'),
          const LinkText( text: 'Blog'),
          const LinkText( text: 'Status'),
          const LinkText( text: 'Carrers'),
          const LinkText( text: 'Brand Resourcers'),
          const LinkText( text: 'Advertising'),
          const LinkText( text: 'Marketing'),
        ],
      )
    );
  }
}