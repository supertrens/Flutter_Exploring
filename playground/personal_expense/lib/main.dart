import 'package:flutter/material.dart';
import 'package:personal_expense/widgets/transaction_list.dart';

import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static final Transaction trx1 = Transaction(
      id: "t1", title: "New Screen", amount: 69.99, date: DateTime.now());

  static final Transaction trx2 = Transaction(
      id: "t2", title: "New MBP", amount: 2669.99, date: DateTime.now());

  final List<Transaction> transactions = [trx1, trx2];

  final _titelController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.blue,
              child: Card(
                color: Colors.amber,
                child: Text("Chart!"),
              ),
            ),
            Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    controller: _titelController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Amount',
                    ),
                  ),
                  FlatButton(
                    child: Text("Add transaction"),
                    textColor: Colors.purple,
                    onPressed: () {
                      _titelController.clear();
                      _amountController.clear();
                    },
                  )
                ],
              ),
            ),
            Column(
              children: transactions.map((trx) => TransactionList(trx)).toList(),
            )
          ],
        ));
  }
}
