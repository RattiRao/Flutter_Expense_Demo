import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat.yMd();

final uuid = Uuid();

enum CategoryExpense { food, travel, leisure, work }

const categoryIcon = {
  CategoryExpense.food: Icons.lunch_dining,
  CategoryExpense.travel: Icons.flight_takeoff,
  CategoryExpense.leisure: Icons.movie,
  CategoryExpense.work: Icons.work
};

class Expense {
  Expense(
      {@required this.title,
      @required this.amount,
      @required this.date,
      @required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final CategoryExpense category;

  String get formattedDate {
    return dateFormat.format(date);
  }
}
