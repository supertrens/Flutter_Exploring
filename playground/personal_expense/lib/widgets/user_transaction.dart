import 'package:flutter/material.dart';

import './../widgets/new_transaction.dart';
import './../widgets/transaction_list.dart';
import './../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  static final Transaction trx1 = Transaction(
      id: "t1", title: "New Screen", amount: 69.99, date: DateTime.now());

  static final Transaction trx2 = Transaction(
      id: "t2", title: "New MBP", amount: 2669.99, date: DateTime.now());

  final List<Transaction> _userTransaction = [trx1, trx2];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        ..._userTransaction.map((trx) => TransactionList(trx)).toList()
      ],
    );
  }
}
