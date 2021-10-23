import 'package:dashboard_/datatables/user_datasource.dart';
import 'package:dashboard_/ui/cards/white_card.dart';
import 'package:dashboard_/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersDataSource = UsersDataSource();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Users View",
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          PaginatedDataTable(columns: const [
            DataColumn(
              label: Text("Avatar"),
            ),
            DataColumn(
              label: Text("Nome"),
            ),
            DataColumn(
              label: Text("Email"),
            ),
            DataColumn(
              label: Text("UID"),
            ),
            DataColumn(
              label: Text("Actions"),
            ),
          ], source: usersDataSource)
        ],
      ),
    );
  }
}
