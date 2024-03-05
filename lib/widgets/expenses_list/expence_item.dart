import 'package:expenses_app/modela/expense.dart';
import 'package:flutter/material.dart';

class ExpenceItem extends StatelessWidget {
  const ExpenceItem(this.item, {super.key});

  final Expense item;
 

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Text(
              item.title,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.currency_rupee, size: 16,),
                    Text('${item.amount}')
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[item.category]),
                    const SizedBox(width: 8,),
                    Text(item.formattedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
