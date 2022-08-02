import 'dart:developer';

import 'package:admin_dashboard/models/categories_response.dart';
import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  BuildContext context;
  List<Categoria> categorias = [];

  CategoriesDTS(this.categorias, this.context);

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
                onPressed: () {
                  final dialog = AlertDialog(
                    title: const Text('¿Está seguro de borrarla?'),
                    content: const Text('Se borrará la categoría'),
                    actions: [
                      TextButton(
                        child: const Text('No'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: const Text('Si, borrar'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (_) => dialog,
                  );
                },
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