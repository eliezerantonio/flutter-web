import 'package:dashboard_/ui/cards/white_card.dart';
import 'package:dashboard_/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Blank",
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          WhiteCard(title: 'Inblank', child: Text("Hello word"))
        ],
      ),
    );
  }
}
