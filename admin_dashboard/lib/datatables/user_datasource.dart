
import 'package:admin_dashboard/extensions/null_extensions.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

import '../models/auth_response.dart';

class UserDTS extends DataTableSource {
  BuildContext context;
  List<Usuario> users = [];

  UserDTS(this.users, this.context);

  @override
  DataRow? getRow(int index) {
    final user = users[index];
    final image = Image(
      image: (user.img != null) ? NetworkImage( user.img.value() ) : const AssetImage('no-image.jpg') as ImageProvider,
      width: 35,
      height: 35
    );
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(image),
        DataCell(Text('${ user.nombre }')),
        DataCell(Text('${ user.correo }')),
        DataCell(Text('${ user.uid }')),
        DataCell(
          IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () {
              NavigationService.replaceTo('/dashboard/users/${ user.uid }');
            },
          )
    ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
  
}