import 'package:flutter/material.dart';
class CategoriesDTS extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(
      
      index: index,
      cells: [
        DataCell(Text("Cell #1 $index "), showEditIcon: true),
        DataCell(Text("Cell #2 $index"), ),
        DataCell(Text("Cell #3 $index"), ),
        DataCell(Text("Cell #4 $index"), ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 1000;

  @override
  int get selectedRowCount => 0;
}
