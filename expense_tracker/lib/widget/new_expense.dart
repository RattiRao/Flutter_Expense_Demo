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

  @override
  void dispose() {
    titleController.dispose();
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
              ElevatedButton(
                  onPressed: () {
                    print(titleController.text);
                  },
                  child: Text('Add Expense')),
            ],
          ),
        ],
      ),
    );
  }
}
