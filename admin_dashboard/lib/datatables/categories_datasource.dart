import 'dart:developer';

import 'package:admin_dashboard/models/categories_response.dart';
import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  List<Categoria> categorias = [];

  CategoriesDTS(this.categorias);

  @override
  DataRow? getRow(int index) {
    final category = categorias[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${ category.id }'), onTap: () => log('Cell 1')),
        DataCell(Text('${ category.nombre }')),
        DataCell(Text('${ category.usuario?.nombre }')),
        DataCell(
          Row(
            children: [
              IconButton(
                splashRadius: 20,
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                splashRadius: 20,
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              )
            ],
          )
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
  
}