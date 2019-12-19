import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? buildEmptyTransactionView(context)
          : buildTransactionListView(context),
    );
  }

  Column buildEmptyTransactionView(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "No transactions added yet",
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 150,
          child: Image.asset(
            "assets/images/waiting.png",
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  ListView buildTransactionListView(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return buildTransactionCard(index, context);
      },
      itemCount: transactions.length,
    );
  }

  Card buildTransactionCard(int index, BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${transactions[index].amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          transactions[index].title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transactions[index].date),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
