import 'package:dashboard_/providers/auth_provider.dart';
import 'package:dashboard_/ui/cards/white_card.dart';
import 'package:dashboard_/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user!;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            "Dashboard",
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          WhiteCard(
            title: user.nombre,
            child: Text(user.correo),
          )
        ],
      ),
    );
  }
}
