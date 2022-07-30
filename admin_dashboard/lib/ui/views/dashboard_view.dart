import 'package:admin_dashboard/extensions/null_extensions.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cards/white_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return SizedBox(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Dashboard View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          WhiteCard(
            title: (authProvider.user?.nombre).value(),
            child: Text((authProvider.user?.correo).value())
          )
        ],
      ),
    );
  }
}