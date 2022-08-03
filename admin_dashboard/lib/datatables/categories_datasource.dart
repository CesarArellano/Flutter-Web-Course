
import 'package:admin_dashboard/extensions/null_extensions.dart';
import 'package:admin_dashboard/models/categories_response.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/modals/category_modal.dart';

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
        DataCell(Text('${ category.id }')),
        DataCell(Text('${ category.nombre }')),
        DataCell(Text('${ category.usuario?.nombre }')),
        DataCell(
          Row(
            children: [
              IconButton(
                splashRadius: 20,
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategoryModal(categoria: category)
                  );
                },
              ),
              IconButton(
                splashRadius: 20,
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  final dialog = AlertDialog(
                    title: const Text('¿Está seguro de borrarla?'),
                    content: Text('Se borrará la categoría ${ category.nombre.value() }'),
                    actions: [
                      TextButton(
                        child: const Text('No'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: const Text('Si, borrar'),
                        onPressed: () {
                          Provider.of<CategoriesProvider>(context, listen: false).removeCategory(category.id.value()).then(( _ ){
                            Navigator.of(context).pop();
                          });
                        }
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