import 'package:dashboard_/ui/cards/white_card.dart';
import 'package:dashboard_/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Categorias",
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          const WhiteCard(title: 'Categorias', child: const Text("Hello word"))
        ],
      ),
    );
  }
}
