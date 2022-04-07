import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/model/transaction.dart';
import 'package:hive_example/pages/transaction_page.dart';
import 'package:hive_flutter/hive_flutter.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transactions');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Hive Expense App';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.indigo),
    home: TransactionPage(),
  );
}