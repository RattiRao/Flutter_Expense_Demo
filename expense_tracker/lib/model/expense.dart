import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat.yMd();

final uuid = Uuid();

enum CategoryExpenseInfo { food, travel, leisure, work }

const categoryIcon = {
  CategoryExpenseInfo.food: Icons.lunch_dining,
  CategoryExpenseInfo.travel: Icons.flight_takeoff,
  CategoryExpenseInfo.leisure: Icons.movie,
  CategoryExpenseInfo.work: Icons.work
};

class ExpenseInfo {
  ExpenseInfo(
      {@required this.title,
      @required this.amount,
      @required this.date,
      @required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final CategoryExpenseInfo category;

  String get formattedDate {
    return dateFormat.format(date);
  }
}
