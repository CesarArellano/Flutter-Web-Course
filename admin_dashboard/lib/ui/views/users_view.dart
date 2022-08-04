import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datatables/user_datasource.dart';
import '../../extensions/null_extensions.dart';
import '../../providers/users_provider.dart';
import '../labels/custom_labels.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final userDataSource = UserDTS(usersProvider.users, context);

    return usersProvider.isLoading
      ? const Center(child: CircularProgressIndicator())
      : SizedBox(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Users View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          PaginatedDataTable(
            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColumnIndex,
            columns: [
              const DataColumn(label: Text('Avatar')),
              DataColumn(label: const Text('Nombre'), onSort: (colIndex, _)  {
                usersProvider.sortColumnIndex = colIndex;
                usersProvider.sort<String>((user) => user.nombre.value());
              }),
              DataColumn(label: const Text('Email'), onSort: (colIndex, _)  {
                usersProvider.sortColumnIndex = colIndex;
                usersProvider.sort<String>((user) => user.correo.value());
              }),
              const DataColumn(label: Text('UID')),
              const DataColumn(label: Text('Acciones')),
            ],
            source: userDataSource,
            onPageChanged: (int page) {
              log(page.toString());
            },
          )
        ],
      ),
    );
  }
}