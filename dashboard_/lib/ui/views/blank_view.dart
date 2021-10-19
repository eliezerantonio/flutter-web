import 'package:dashboard_/ui/cards/white_card.dart';
import 'package:dashboard_/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            "Blank",
            style: CustomLabels.h1,
          ),
          SizedBox(height: 10),
          WhiteCard(title: 'Inblank', child: Text("Hello word"))
        ],
      ),
    );
  }
}
