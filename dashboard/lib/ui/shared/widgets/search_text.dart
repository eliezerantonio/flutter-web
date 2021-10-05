import 'package:dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        decoration: buildBoxDecoration(),
        child: TextField(
          decoration: CustomInputs.searchInputDecoration(
              hint: 'Buscar', icon: Icons.search),
        ));
  }

  buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.2),
        
      );
}
