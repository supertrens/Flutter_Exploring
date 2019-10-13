import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final addNewTrxHandler;
  NewTransaction(this.addNewTrxHandler);

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: _titleController,
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
              addNewTrxHandler(
                  _titleController.text, double.parse(_amountController.text));
              _titleController.clear();
              _amountController.clear();
            },
          )
        ],
      ),
    );
  }
}
