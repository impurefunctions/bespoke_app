import 'dart:async';

import 'package:intl/intl.dart';

import '../constants/appstrings.dart';

class Validator {
  var emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if(email.isEmpty){
        sink.addError(cannotBeEmpty);
      }
      if(!email.isValidEmail()){
        sink.addError(invalidEmail);
      }
      /*if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
        sink.addError(invalidEmail);
      } else {
        sink.add(email);
      }*/
    },
  );

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if(password.isEmpty){
        sink.addError(cannotBeEmpty);
      }
      if (!RegExp(r"^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%&*]{6,20}$")
              .hasMatch(password) &&
          password.length > 8) {
        sink.addError(invalidPassword);
      } else {
        sink.add(password);
      }
    },
  );

  var textValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (String fullName, sink) {
      if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(fullName)) {
        sink.addError(invalidName);
      } else {
        sink.add(fullName);
      }
    },
  );

  var numberValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (String phoneNumber, sink) {
      if (!RegExp(r'\d').hasMatch(phoneNumber)) {
        sink.addError(invalidPhone);
      } else {
        sink.add(phoneNumber);
      }
    },
  );



  var dateValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (String date, sink) {
      var format = new DateFormat('dd-MM-yyyy');
      if (date.isEmpty || date.length < 10 || date == null) {
        sink.addError(cannotBeEmpty);
      } else if (format.parse(date) == null ) {
        sink.addError('Invalid Date');
      } else if (format.parse(date).isAfter(DateTime.utc(2003, 12, 31))) {
        sink.addError("You need to be over 16 years old to sign up");
      } else {
        sink.add(date);
      }
    },
  );

  var phoneNumberValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (String phoneNumber, sink) {
      if (phoneNumber.isEmpty) {
        sink.addError('Phone Number Cannot be empty');
      } else if (!RegExp(r'\d').hasMatch(phoneNumber)) {
        sink.addError(invalidPhone);
      } else if (!phoneNumber.startsWith('7') && phoneNumber.length != 7) {
        sink.addError("Your phone number should be at least 7 characters");
      } else if (phoneNumber.startsWith('7') && phoneNumber.length != 8) {
        sink.addError("Cell numbers should be 8 digits long");
      } else {
        sink.add(phoneNumber);
      }
    },
  );

  var notEmpty = StreamTransformer<String, String>.fromHandlers(
      handleData: (String field, sink) {
    if (field.isEmpty || field.isEmpty || field == null) {
      sink.addError(cannotBeEmpty);
    } else {
      sink.add(field);
    }
  });
}
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}