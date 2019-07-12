import 'package:flutter/material.dart';

import '../models/transaction.dart';

class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addNewTransactionHandler;

  NewTransaction(this.addNewTransactionHandler);

  void newTransaction() {
    Transaction newTransaction = Transaction(
        id: "t1",
        title: titleController.text,
        amount: double.tryParse(amountController.text) ?? 0,
        date: DateTime.now());

        addNewTransactionHandler(newTransaction);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add transaction'),
              textColor: Colors.purple,
              onPressed: newTransaction,
            )
          ],
        ),
      ),
    );
  }
}
