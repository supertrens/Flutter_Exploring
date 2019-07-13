import 'package:flutter/material.dart';

import '../models/transaction.dart';

class NewTransaction extends StatefulWidget {

  final Function addNewTransactionHandler;

  NewTransaction(this.addNewTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void newTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount.isNegative){
      return;
    }

    Transaction newTransaction = Transaction(
        id: "t1",
        title: enteredTitle,
        amount: enteredAmount,
        date: DateTime.now()
    );

    widget.addNewTransactionHandler(newTransaction);

    // to close the form when submit
    Navigator.of(context).pop();
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
              keyboardType: TextInputType.number,
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
