
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category {
  work, leisure, food, travel
}

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.camera_indoor,
  Category.travel: Icons.travel_explore,
  Category.work: Icons.work
};

class Expense {
  Expense({required this.title, required this.amount, required this.category, required this.date}) : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final Category category;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date); 
  }
}