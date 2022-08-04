import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/categories_response.dart';
import '../buttons/custom_icon_button.dart';
import '../labels/custom_labels.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  Future<void> getCategories() async {
    setState(() => _loading = true);
    await Provider.of<CategoriesProvider>(context, listen: false).getCategories();
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    List<Categoria> categorias = Provider.of<CategoriesProvider>(context).categories;
    return _loading
    ? const Center( child: CircularProgressIndicator() )
    : SizedBox(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Categories View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Categoría')),
              DataColumn(label: Text('Creado por')),
              DataColumn(label: Text('Acciones')),
            ],
            source: CategoriesDTS( categorias, context ),
            header: const Text('Categorias'),
            rowsPerPage: _rowsPerPage,
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? PaginatedDataTable.defaultRowsPerPage;
              });
            },
            actions: [
              CustomIconButton(
                text: 'Agregar',
                icon: Icons.add_outlined,
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => const CategoryModal()
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}