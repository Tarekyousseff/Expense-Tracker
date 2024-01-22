import 'package:flutter/material.dart';
import 'package:gym_sup/data/expense_data.dart';
import 'package:gym_sup/models/expense_model.dart';
import 'package:gym_sup/pages/home/home_view.dart';
import 'package:gym_sup/widgets/custom_button.dart';
import 'package:gym_sup/widgets/custom_test_field.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final newExpenseName = TextEditingController();
final newExpenseAccount = TextEditingController();

class _HomePageState extends State<HomePage> {
  void addNewExpense() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actionsPadding: const EdgeInsets.only(bottom: 30, right: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: Colors.blueGrey.shade100,
              title: const Text(
                'Add New Expense',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    keyboardType: TextInputType.name,
                    controller: newExpenseName,
                    hintText: 'Expense Name',
                    inputColor: Colors.blue,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: newExpenseAccount,
                    hintText: 'Expense Account',
                    inputColor: Colors.red,
                  )
                ],
              ),
              actions: [
                SizedBox(
                  width: 70,
                  height: 40,
                  child: CustomButton(
                    buttonColor: Colors.white,
                    buttonTextColor: Colors.red,
                    buttonText: 'Save',
                    onPress: () {
                      save();
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 70,
                  height: 40,
                  child: CustomButton(
                    buttonColor: Colors.white,
                    buttonTextColor: Colors.blue,
                    buttonText: 'Cancel',
                    onPress: () {
                      cancel();
                    },
                  ),
                )
              ],
            ));
  }

  void save() {
    ExpenseItem newExpense = ExpenseItem(
        amount: newExpenseAccount.text,
        nameItem: newExpenseName.text,
        dateTime: DateTime.now());
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newExpenseAccount.clear();
    newExpenseName.clear();
  }

  @override
  void initState() {
    Provider.of<ExpenseData>(context, listen: false).prepareData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: addNewExpense,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: homeView(context),
    );
  }
}
