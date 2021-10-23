import 'package:dashboard_/datatables/user_datasource.dart';
import 'package:dashboard_/providers/users_provider.dart';
import 'package:dashboard_/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDataSource = UsersDataSource(usersProvider.users);
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
          PaginatedDataTable(
            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColumnIndex,
            columns: [
              const DataColumn(
                label: Text("Avatar"),
              ),
              DataColumn(
                  label: const Text("Nome"),
                  onSort: (colIndex, _) {
                    usersProvider.sortColumnIndex = colIndex;
                    usersProvider.sort<String>((user) => user.nombre);
                  }),
              DataColumn(
                  label: const Text("Email"),
                  onSort: (colIndex, _) {
                      usersProvider.sortColumnIndex = colIndex;
                    usersProvider.sort<String>((user) => user.correo);
                  }),
              const DataColumn(
                label: Text("UID"),
              ),
              const DataColumn(
                label: Text("Actions"),
              ),
            ],
            source: usersDataSource,
            onRowsPerPageChanged: (page) {
              debugPrint("$page");
            },
          )
        ],
      ),
    );
  }
}
