import 'package:dashboard_/models/category.dart';
import 'package:dashboard_/providers/categories_provider.dart';
import 'package:dashboard_/services/notifications_service.dart';
import 'package:dashboard_/ui/buttons/custom_outline_button.dart';
import 'package:dashboard_/ui/inputs/custom_inputs.dart';
import 'package:dashboard_/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  const CategoryModal({Key? key, this.categoria}) : super(key: key);

  final Categoria? categoria;

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(
        20,
      ),
      height: 500,
      width: 300,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.categoria?.nombre ?? "Nova categoria",
                style: CustomLabels.h1.copyWith(
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          Divider(color: Colors.white.withOpacity(0.3)),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: widget.categoria?.nombre ?? '',
            onChanged: (value) => nombre = value,
            decoration: CustomInputs.authInputDecoration(
              hint: 'Nome da cateogira',
              label: 'Categoria',
              icon: Icons.new_releases_outlined,
            ),
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {
                try {
                  if (id == null) {
                    //criar
                    await categoryProvider.newCategory(nombre);
                    NotificationsService.showSnackbarSuccess("$nombre Criado");
                  } else {
                    //atualizar
                    await categoryProvider.updateCategory(nombre, id!);
                    NotificationsService.showSnackbarSuccess(
                        "$nombre Atualizado");
                  }
                  Navigator.of(context).pop();
                } catch (e) {
                  Navigator.of(context).pop();
                  NotificationsService.showSnackbarError(e.toString());
                }
              },
              text: "Salvar",
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Color(0xff0f2041),
        boxShadow: [
          BoxShadow(color: Colors.black26),
        ],
      );
}
