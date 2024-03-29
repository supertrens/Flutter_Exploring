import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: noTransactionView(context),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              // return buildCard(transactions[index], context);
              return buildCard(index, context);
            },
            itemCount: transactions.length,
          );
  }

  List<Widget> noTransactionView(BuildContext context) {
    return <Widget>[
            Text(
              'No transaction added yet',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 200,
                child: Image.asset(
                  "assets/images/waiting.png",
                  fit: BoxFit.cover,
                )),
          ];
  }

  Card 
  buildCard(int index, BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text("\$${transactions[index].amount.toStringAsFixed(2)}"),
            ),
          ),
        ),
        title: Text(
          transactions[index].title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transactions[index].date),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => deleteTransaction(index),
        ),
      ),
    );
  }
}
