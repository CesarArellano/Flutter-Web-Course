import 'package:flutter/material.dart';
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
            onPressed: () => Navigator.pushNamed(context, '/stateful'),
          ),

          const SizedBox(width: 10),
          
          CustomFlatButton(
            color: Colors.black,
            text: 'Contador Provider',
            onPressed: () => Navigator.pushNamed(context, '/provider'),
          ),

          const SizedBox(width: 10),
          CustomFlatButton(
            color: Colors.black,
            text: 'Otra página',
            onPressed: () => Navigator.pushNamed(context, '/ABC'),
          ),
        ],
      ),
    );
  }
}