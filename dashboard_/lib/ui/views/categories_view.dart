import 'package:dashboard_/datatables/categories_datasource.dart';
import 'package:dashboard_/providers/categories_provider.dart';
import 'package:dashboard_/ui/buttons/custom_icon_button.dart';
import 'package:dashboard_/ui/cards/white_card.dart';
import 'package:dashboard_/ui/labels/custom_labels.dart';
import 'package:dashboard_/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context).categories;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Categorias",
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text("ID")),
              DataColumn(label: Text("Categoria")),
              DataColumn(label: Text("Criado por")),
              DataColumn(label: Text("Accoes")),
            ],
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value!;
              });
            },
            source: CategoriesDTS(categorias, context),
            header: const FittedBox(
              fit: BoxFit.contain,
              child: Text("Todas categorias disponiveis", maxLines: 2),
            ),
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                icon: Icons.add_outlined,
                onPressed: () {
                  print("cliquei no bt");
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategoryModal(
                      categoria: null,
                    ),
                  );
                },
                text: 'Criar',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
