import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widget/Expense_List/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({Key key, @required this.expenses}) : super(key: key);
  final List<ExpenseInfo> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) {
          return ExpenseItem(expense: expenses[index]);
        });
  }
}
