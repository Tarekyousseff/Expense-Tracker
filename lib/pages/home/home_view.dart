import 'package:flutter/material.dart';
import 'package:gym_sup/components/expense_summary.dart';
import 'package:gym_sup/components/expense_tile.dart';
import 'package:gym_sup/data/expense_data.dart';
import 'package:provider/provider.dart';

Widget homeView(BuildContext context) {
  return Consumer<ExpenseData>(
      builder: (context, value, child) => ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              ExpenseSummary(startOfWeek: value.startOfWeekDate()),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.getAllExpenseList().length,
                itemBuilder: (context, index) {
                  return ExpenseTile(
                      title: value.getAllExpenseList()[index].nameItem,
                      subtitle:
                          value.getAllExpenseList()[index].dateTime.toString(),
                      amount: '\$${value.getAllExpenseList()[index].amount}');
                },
              )
            ],
          ));
}
