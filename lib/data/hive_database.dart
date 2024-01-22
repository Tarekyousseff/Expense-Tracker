import 'package:gym_sup/models/expense_model.dart';
import 'package:hive/hive.dart';

class HiveDataBase {
  // refrence our box
  final _myBox = Hive.box('expense_database');
  // write data
  void saveData(List<ExpenseItem> allExpense) {
    List<List<dynamic>> allExpensesFormated = [];
    for (var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.amount,
        expense.dateTime,
        expense.nameItem,
      ];
      allExpensesFormated.add(expenseFormatted);
    }
    _myBox.put("All_expenses", allExpensesFormated);
  }
  //read data

  List<ExpenseItem> readData() {
    List savedExpenses = _myBox.get("All_expenses") ?? [];
    List<ExpenseItem> allExpenses = [];
    for (int i = 0; i < savedExpenses.length; i++) {
      String name = savedExpenses[i][2];
      String amount = savedExpenses[i][0];
      DateTime dateTime = savedExpenses[i][1];
      ExpenseItem expenseItem =
          ExpenseItem(amount: amount, nameItem: name, dateTime: dateTime);
      allExpenses.add(expenseItem);
    }
    return allExpenses;
  }
}
