import 'package:flutter/material.dart';

import '../cards/white_card.dart';
import '../labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Icons View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: const [
              WhiteCard(
                width: 170,
                title: 'ac_unit_outlined',
                child: Center( child: Icon( Icons.ac_unit_outlined, size: 40) )
              ),
              WhiteCard(
                width: 170,
                title: 'access_alarm_outlined',
                child: Center( child: Icon( Icons.access_alarm_outlined, size: 40) )
              ),
              WhiteCard(
                width: 170,
                title: 'access_time_outlined',
                child: Center( child: Icon( Icons.access_time_outlined, size: 40) )
              ),
              WhiteCard(
                width: 170,
                title: 'all_inbox_outlined',
                child: Center( child: Icon( Icons.all_inbox_outlined, size: 40) )
              ),
              WhiteCard(
                width: 170,
                title: 'desktop_mac_outlined',
                child: Center( child: Icon( Icons.desktop_mac_outlined, size: 40) )
              ),
              WhiteCard(
                width: 170,
                title: 'keyboard_alt_outlined',
                child: Center( child: Icon( Icons.keyboard_alt_outlined, size: 40) )
              ),
              WhiteCard(
                width: 170,
                title: 'safety_check_outlined',
                child: Center( child: Icon( Icons.safety_check_outlined, size: 40) )
              ),
            ],
          )
        ],
      ),
    );
  }
}