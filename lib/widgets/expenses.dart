import 'package:expenses_app/modela/expense.dart';
import 'package:expenses_app/widgets/expenses_list/expence_list.dart';
import 'package:expenses_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Cource',
        amount: 19.99,
        category: Category.work,
        date: DateTime.now()),
    Expense(
        title: 'Cinema',
        amount: 7.99,
        category: Category.leisure,
        date: DateTime.now()),
    Expense(
        title: 'Food',
        amount: 2.50,
        category: Category.food,
        date: DateTime.now()),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(
            onAddExpense: _addExpense,
            onRemoveExpense: _removeExpense,
          );
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
      content: Text('Expense added..'),
    ));
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      content: const Text('Expense deleted..'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Text(
      'No expenses found. Start adding expenses',
      style: TextStyle(fontSize: 18),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenceList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Chart',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            mainContent,
          ],
        ),
      ),
    );
  }
}
