import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  final String token;
  const TransactionsScreen({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('transactions_screen'),
      ),
    );
  }
}