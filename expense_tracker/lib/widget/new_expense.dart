import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amtController = TextEditingController();

  void _openDatePicker() {
    final today = DateTime.now();
    final firstDate = DateTime(today.year - 1, today.month, today.day);
    showDatePicker(
        context: context,
        initialDate: today,
        firstDate: firstDate,
        lastDate: today);
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
      padding: const EdgeInsets.all(16.0),
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
                    Text('Enter Date'),
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
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    print('Title: ${titleController.text}');
                    print('Amount: ${amtController.text}');
                  },
                  child: Text('Add Expense')),
            ],
          ),
        ],
      ),
    );
  }
}
