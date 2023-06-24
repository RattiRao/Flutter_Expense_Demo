import 'package:expense_tracker/Widget/Expense_List/expenses_list.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenseList = [
    Expense(
        title: 'My First Expense',
        amount: 33.79,
        date: DateTime.now(),
        category: CategoryExpense.work),
    Expense(
        title: 'My Second Expense',
        amount: 50.79,
        date: DateTime.now(),
        category: CategoryExpense.leisure)
  ];

  @override
  void setState(fn) {}

  void _openAddExpenseOverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _openAddExpenseOverlay();
              }),
        ],
        title: Text('Expenses'),
      ),
      body: ExpensesList(expenses: expenseList),
    );
  }
}