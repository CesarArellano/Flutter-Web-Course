import 'package:flutter/material.dart';

import '../cards/white_card.dart';
import '../labels/custom_labels.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Blank View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          const WhiteCard(
            title: 'Blank',
            child: Text('Hola Mundo')
          )
        ],
      ),
    );
  }
}