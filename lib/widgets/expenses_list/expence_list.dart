import 'package:expenses_app/modela/expense.dart';
import 'package:expenses_app/widgets/expenses_list/expence_item.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget {
     ExpenceList({super.key, required this.expenses, required this.onRemoveExpense});
  void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (ctx, index) => Dismissible(key: ValueKey(expenses[index]), background: Container(color: const Color.fromARGB(255, 255, 163, 157),), onDismissed: (direction) => onRemoveExpense(expenses[index]), child: ExpenceItem(expenses[index]))),
    );
  }
}
