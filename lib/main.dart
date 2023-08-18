import 'package:flutter/material.dart';
import 'package:syncfunsion_zencillo/gridcolumn.dart';
import 'package:syncfunsion_zencillo/model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Syncfusion SfDataGrid'),
        ),
        body: MyDataGrid(),
      ),
    );
  }
}

class Person {
  Person(this.id, this.name, this.age);

  final int id;
  final String name;
  final int age;
}

class MyDataGrid extends StatefulWidget {
  @override
  State<MyDataGrid> createState() => _MyDataGridState();
}

class _MyDataGridState extends State<MyDataGrid> {
  final List<Person> people = [
    Person(1, 'Alice', 25),
    Person(2, 'Bob', 30),
    Person(3, 'Charlie', 22),
    // Add more people as needed
  ];
  late Map<String, double> columnWidths = {
    'name': double.nan,
    'age': double.nan,
    'city': double.nan,
  };

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      source: _SettingDataSource(context, people),
      columns: gridColumn(columnWidths, context),
      onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
        setState(() {
          columnWidths[details.column.columnName] = details.width;
        });
        return true;
      },
      allowSorting: true,
      allowColumnsResizing: true, // This enables column resizing
      allowFiltering: true,
      navigationMode: GridNavigationMode.cell,
      gridLinesVisibility: GridLinesVisibility.both,
      headerGridLinesVisibility: GridLinesVisibility.both,
    );
  }
}

class _SettingDataSource extends DataGridSource {
  _SettingDataSource(BuildContext context, List<Person> people) {
    _data = people.map<DataGridRow>((e) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'id', value: e.id),
        DataGridCell<String>(columnName: 'name', value: e.name),
        DataGridCell<int>(columnName: 'age', value: e.age),
      ]);
    }).toList();
  }

  List<DataGridRow> _data = [];

  @override
  List<DataGridRow> get rows => _data;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataCell) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Text(dataCell.value.toString()),
        );
      }).toList(),
    );
  }
}
