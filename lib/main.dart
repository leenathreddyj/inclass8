import 'package:flutter/material.dart';
import 'database_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper();  // ❌ FIXED: Removed incorrect 'instance'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _insert,
              child: const Text('Insert'),
            ),
            ElevatedButton(
              onPressed: _query,
              child: const Text('Query All'),
            ),
            ElevatedButton(
              onPressed: _queryById,
              child: const Text('Query by ID (1)'),
            ),
            ElevatedButton(
              onPressed: _update,
              child: const Text('Update ID 1'),
            ),
            ElevatedButton(
              onPressed: _delete,
              child: const Text('Delete Last'),
            ),
            ElevatedButton(
              onPressed: _deleteAll,
              child: const Text('Delete All'),
            ),
          ],
        ),
      ),
    );
  }

  void _insert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: 'Alice',
      DatabaseHelper.columnAge: 30
    };
    final id = await dbHelper.insert(row);
    debugPrint('Inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    debugPrint('Query all rows:');
    for (final row in allRows) {
      debugPrint(row.toString());
    }
  }

  void _queryById() async {
    final row = await dbHelper.queryRowById(1);
    debugPrint(row != null ? 'Found row: $row' : 'No row found with ID 1');
  }

  void _update() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnName: 'Updated Name',
      DatabaseHelper.columnAge: 35
    };
    final rowsAffected = await dbHelper.update(row);
    debugPrint('Updated $rowsAffected row(s)');
  }

  void _delete() async {
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    debugPrint('Deleted $rowsDeleted row(s): row $id');
  }

  void _deleteAll() async {
    final count = await dbHelper.deleteAll();
    debugPrint('Deleted all rows: $count');
  }
}  // ✅ FIXED: Added missing closing bracket
