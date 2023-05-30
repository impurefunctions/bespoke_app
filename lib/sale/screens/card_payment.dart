import 'package:bespoke_app/sale/index.dart';
import 'package:checkmark/checkmark.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/api/main/base_main.dart';
import '../../utils/api/main/main_service.dart';

class CardPaymentPage extends StatefulWidget {
  final double amount;
  const CardPaymentPage({Key? key, required this.amount}) : super(key: key);


  @override
  _CardPaymentPageState createState() => _CardPaymentPageState();
}

class _CardPaymentPageState extends State<CardPaymentPage> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();

  final GlobalKey<FormState> _cardPaymentFormKey = GlobalKey<FormState>();

  BaseAPIService apiService = MainApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Payment'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _cardPaymentFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Card Holder's Name"),
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: _cardHolderController,
                decoration: const InputDecoration(
                  hintText: 'Enter card holder name',
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  return validateCardHolder(value);
                },
                inputFormatters: const [
                  //TODO
                ],
              ),


              const Text(
                'Card Number',
                style: TextStyle(fontSize: 16.0),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: _cardNumberController,
                decoration: const InputDecoration(
                  hintText: 'Enter your card number',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                  // CreditCardNumberFormatter(),
                ],
                validator: (value) {
                  return validateCardNumber(value);
                },
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Expiry Date (MM/YY)',
                style: TextStyle(fontSize: 16.0),
              ),
              TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: _expiryController,
                  decoration: const InputDecoration(
                    hintText: 'Enter expiry date (MM/YY)',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    ExpiryDateFormatter(),
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    ExpiryDateFormatter(),
                  ],
                  validator: (value) {
                    return validateExpiryDate(value);
                  }),
              const SizedBox(height: 16.0),
              const Text(
                'CVV',
                style: TextStyle(fontSize: 16.0),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                onFieldSubmitted: (value) {
                  print(validateCvv(value));
                },
                controller: _cvvController,
                decoration: const InputDecoration(
                  hintText: 'Enter CVV',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                validator: (value) =>
                value!.isEmpty ? 'Please enter CVV' : null,
              ),
              SizedBox(height: 32.h),
              ElevatedButton(
                onPressed: () {

                  if (_cardPaymentFormKey.currentState!.validate()) {
                    // Handle payment logic here
                    String cardNumber = _cardNumberController.text;
                    String expiryDate = _expiryController.text;
                    String cvv = _cvvController.text;
                    String cardHolderName = _cardHolderController.text;

                    Map<String, dynamic> paymentDetails = {
                      'card_number': cardNumber,
                      'expiryDate': expiryDate,
                      'cvv': cvv,
                      'cardHolderName': cardHolderName,
                      'amount': widget.amount
                    };


                    apiService.createTransaction(paymentDetails).then((value) => showModalBottomSheet(context: context, builder: (context) {
                      return SizedBox(
                        height: 350.h,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [

                              SizedBox(
                                height: 100.h,
                                width: 100.w,
                                child: const CheckMark(
                                  active: true,
                                  curve: Curves.decelerate,
                                  duration: Duration(milliseconds: 500),
                                ),
                              ),
                              const Text('Payment Successful'),
                            ],
                          ),
                        ),
                      );
                    }).then((value) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SaleScreen(token: "",)));
                    }));
                  }
                },
                child: const Text('Pay Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Card Validation
  String? validateCardNumber(String? value) {
    if (value!.isEmpty) {
      return 'Please enter card number';
    }
    if (value!.length != 16) {
      return 'Please enter a valid 16 digit card number';
    }
    return null;
  }

  String? validateCardHolder(String? value) {
    if (value!.isEmpty) {
      return 'Please enter card holder name';
    }
    return null;
  }

  String? validateExpiryDate(String? value) {
    if (value == null) {
      return '1.Please enter a valid date (MM/YY)';
    }

    final expiryDateParts = value.split('/');
    /* if (expiryDateParts.length != 2) {
      return 'Enter a valid date (MM/YY)';
    }*/

    final month = int.tryParse(expiryDateParts[0]);
    final year = int.tryParse(expiryDateParts[1]);
    if (month == null || year == null) {
      return '2.Enter a valid date (MM/YY)';
    }

    final now = DateTime.now();
    final currentYear = now.year;
    final currentMonth = now.month;

    if (int.parse("20$year") < currentYear || (int.parse("20$year")  == currentYear && month < currentMonth)) {
      return '3. Enter a valid date (MM/YY)';
    }

    if (month < 1 || month > 12) {
      return 'Enter a valid date (MM/YY)';
    }

    return null;
  }

  String? validateCvv(String? value) {
    if (value!.isEmpty) {
      return 'Please enter CVV';
    }
    if (value.length != 3) {
      return 'Please enter a valid 3 digit CVV';
    }
    return null;
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    // Remove any non-digits
    text = text.replaceAll(RegExp(r'\D'), '');

    var newText = '';

    if (text.length > 2) {
      newText += '${text.substring(0, 2)}/';
      text = text.substring(2);
    }

    newText += text;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
