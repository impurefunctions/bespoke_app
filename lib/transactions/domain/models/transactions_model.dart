// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransactionModel {
  final String serviceId;
  final  String feeType;
  final String userId;
  final List<String> paymentsMade;
  final double amount;
  final DateTime paymentDate;
  final bool isPaid;



  TransactionModel({ required this.serviceId,
    required this.feeType, required this.userId,
    required this.paymentsMade, required this.amount, required this.paymentDate,
    required this.isPaid});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      serviceId: json['serviceId'] as String,
      feeType: json['feeType'] as String,
      userId: json['userId'] as String,
      paymentsMade: json['paymentsMade'].cast<String>() as List<String>,
      amount: json['amount'] as double,
      paymentDate: json['paymentDate'] as DateTime,
      isPaid: json['isPaid'] as bool,
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceId'] = serviceId;
    data['feeType'] = feeType;
    data['userId'] = userId;
    data['paymentsMade'] = paymentsMade;
    data['amount'] = amount;
    data['paymentDate'] = paymentDate;
    data['isPaid'] = isPaid;

    return data;
  }
}
