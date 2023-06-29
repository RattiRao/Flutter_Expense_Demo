import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key key, this.onAddExpense}) : super(key: key);
  final void Function(ExpenseInfo expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amtController = TextEditingController();
  DateTime _selectedDate;
  CategoryExpenseInfo _selectedCategory;

  void _openDatePicker() async {
    final today = DateTime.now();
    final firstDate = DateTime(today.year - 1, today.month, today.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: firstDate,
        lastDate: today);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _validateExpense() {
    final amount = double.tryParse(amtController.text.trim());
    bool isValidAmount = amount != null && amount >= 0;

    if (!isValidAmount ||
        titleController.text.trim().isEmpty ||
        _selectedDate == null ||
        _selectedCategory == null) {
      //Show error
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Invalid Input'),
                content: Text(
                    'Please make sure valid title, amount, category and dates are entered'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(ctx), child: Text('Ok'))
                ],
              ));
      return;
    }

    widget.onAddExpense(ExpenseInfo(
        title: titleController.text,
        amount: double.parse(amtController.text),
        date: _selectedDate,
        category: _selectedCategory));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    titleController.dispose();
    amtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: amtController,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Amount', prefixText: '\$ '),
              )),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Text(_selectedDate == null
                        ? 'Enter Date'
                        : dateFormat.format(_selectedDate)),
                    IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: _openDatePicker),
                  ])),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: CategoryExpenseInfo.values
                    .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                            category.toString().split('.').last.toUpperCase())))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: _validateExpense, child: Text('Add Expense')),
            ],
          ),
        ],
      ),
    );
  }
}
