import 'package:dashboard_/models/category.dart';
import 'package:dashboard_/providers/categories_provider.dart';
import 'package:dashboard_/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesDTS extends DataTableSource {
  CategoriesDTS(this.categorias, this.context);

  final List<Categoria> categorias;
  final BuildContext context;

  @override
  DataRow? getRow(int index) {
    final category = categorias[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Text(category.id),
        ),
        DataCell(
          Text(category.nombre),
        ),
        DataCell(
          Text(category.usuario.nombre),
        ),
        DataCell(
          Row(children: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) => CategoryModal(
                    categoria: category,
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete_outlined,
                  color: Colors.red.withOpacity(0.8)),
              onPressed: () {
                final dialog = AlertDialog(
                  title: const Text("Esta seguro de Eliminar ?"),
                  content: Text('Eliminar definivamente ${category.nombre} ?'),
                  actions: [
                    TextButton(
                        child: const Text("Não"),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    TextButton(
                        child: const Text("Sim, eliminar"),
                        onPressed: () async {
                          await Provider.of<CategoriesProvider>(context,
                                  listen: false)
                              .delete(category.id);

                          Navigator.pop(context);
                        }),
                  ],
                );

                showDialog(context: context, builder: (_) => dialog);
              },
            ),
          ]),
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
