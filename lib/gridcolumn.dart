import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

var styleTitle = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
List<GridColumn> gridColumn(
    Map<String, double> columnWidths, BuildContext context) {
  return [
    GridColumn(
      columnName: 'name',
      minimumWidth: MediaQuery.of(context).size.width / 5.5,
      width: columnWidths['name']!,
      label: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: Text(
          'NOMBRE',
          style: styleTitle,
        ),
      ),
    ),
    GridColumn(
      columnName: 'age',
      minimumWidth: MediaQuery.of(context).size.width / 5.5,
      width: columnWidths['age']!,
      label: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: Text(
          'age',
          style: styleTitle,
        ),
      ),
    ),
    GridColumn(
      columnName: 'city',
      minimumWidth: MediaQuery.of(context).size.width / 5.5,
      width: columnWidths['city']!,
      label: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: Text(
          'city',
          style: styleTitle,
        ),
      ),
    ),
  ];
}
