import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/widgets/chart_bar.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        final currentDate = recentTransactions[i].date;
        if (currentDate.day == weekDay.day &&
            currentDate.month == weekDay.month &&
            currentDate.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedTransactionValues.map((trx) {
              double maxSpending = totalSpending > 0.0
                  ? (trx['amount'] as double) / totalSpending
                  : 0.0;
              return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(trx['day'], trx['amount'], maxSpending));
            }).toList()),
      ),
    );
  }
}
