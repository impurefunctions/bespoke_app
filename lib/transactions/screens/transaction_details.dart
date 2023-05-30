import 'package:bespoke_app/transactions/domain/index.dart';
import 'package:flutter/material.dart';

class TransactionDetails extends StatefulWidget {
  final TransactionModel transactionModel;
  const TransactionDetails({Key? key, required this.transactionModel}) : super(key: key);

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: Column(

        children: [

        ],
      ),
    );
  }
}
