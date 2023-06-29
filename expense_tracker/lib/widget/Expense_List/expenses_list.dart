import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widget/Expense_List/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {Key key, @required this.expenses, @required this.onDeleteExpense})
      : super(key: key);
  final List<ExpenseInfo> expenses;
  final void Function(ExpenseInfo expense) onDeleteExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
              key: ValueKey(expenses[index]),
              onDismissed: (direction) {
                onDeleteExpense(expenses[index]);
              },
              child: ExpenseItem(expense: expenses[index]));
        });
  }
}
