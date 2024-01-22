import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gym_sup/data/hive_database.dart';
import 'package:gym_sup/datetime/date_time_helper.dart';
import 'package:gym_sup/models/expense_model.dart';

class ExpenseData extends ChangeNotifier {
  // list of all expense
  List<ExpenseItem> overAllExpenselist = [];
  // get all expense
  List<ExpenseItem> getAllExpenseList() {
    return overAllExpenselist;
  }

  //add expense
  void addNewExpense(ExpenseItem expenseItem) {
    overAllExpenselist.add(expenseItem);
    notifyListeners();
    db.saveData(overAllExpenselist);
  }

  //prepare data to display
  final db = HiveDataBase();
  void prepareData() {
    if (db.readData().isNotEmpty) {
      overAllExpenselist = db.readData();
    }
  }

  //delete expense
  void deleteExpense(ExpenseItem expenseItem) {
    overAllExpenselist.remove(expenseItem);
    notifyListeners();
    db.saveData(overAllExpenselist);
  }
  // get weekday

  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thur";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return '';
    }
  }

  DateTime startOfWeekDate() {
    DateTime? startOfweek;
    // get todays date
    DateTime today = DateTime.now();
    // go backword from today to finf sunday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startOfweek = today.subtract(Duration(days: i));
      }
    }
    return startOfweek!;
  }

  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpneseSummary = {
      // date (yyymmdd): amountTotalForDay
    };

    for (var expense in overAllExpenselist) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpneseSummary.containsKey(date)) {
        double currentAmount = dailyExpneseSummary[date]!;
        currentAmount += amount;
        dailyExpneseSummary[date] = currentAmount;
      } else {
        dailyExpneseSummary.addAll({date: amount});
      }
    }
    return dailyExpneseSummary;
  }
}
