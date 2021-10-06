import 'package:dashboard/ui/cards/white_card.dart';
import 'package:dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            "Dashboard",
            style: CustomLabels.h1,
          ),
          SizedBox(height: 10),
          WhiteCard(title: 'Sales statistics', child: Text("Hello word"))
        ],
      ),
    );
  }
}
