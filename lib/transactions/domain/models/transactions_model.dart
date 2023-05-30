// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransactionModel {
  List<PaymentsMade>? paymentsMade;
  bool? isPaid;
  String? sId;
  String? userId;
  int? amount;
  String? paymentDate;
  String? createdAt;
  String? updatedAt;
  int? iV;

  TransactionModel(
      {this.paymentsMade,
        this.isPaid,
        this.sId,
        this.userId,
        this.amount,
        this.paymentDate,
        this.createdAt,
        this.updatedAt,
        this.iV});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    if (json['paymentsMade'] != null) {
      paymentsMade = <PaymentsMade>[];
      json['paymentsMade'].forEach((v) {
        paymentsMade!.add(new PaymentsMade.fromJson(v));
      });
    }
    isPaid = json['isPaid'];
    sId = json['_id'];
    userId = json['userId'];
    amount = json['amount'];
    paymentDate = json['paymentDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentsMade != null) {
      data['paymentsMade'] = this.paymentsMade!.map((v) => v.toJson()).toList();
    }
    data['isPaid'] = this.isPaid;
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['amount'] = this.amount;
    data['paymentDate'] = this.paymentDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class PaymentsMade {
  int? amountPaid;

  PaymentsMade({this.amountPaid});

  PaymentsMade.fromJson(Map<String, dynamic> json) {
    amountPaid = json['amountPaid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amountPaid'] = this.amountPaid;
    return data;
  }
}
