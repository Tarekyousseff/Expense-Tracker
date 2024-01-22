import 'package:flutter/material.dart';
import 'package:gym_sup/data/expense_data.dart';
import 'package:gym_sup/pages/home/home_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();
  // open a Hive Box
  await Hive.openBox('expense_database');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.blueAccent.shade100),
        home: const HomePage(),
      ),
    );
  }
}
