import 'dart:async';

import 'package:bespoke_app/utils/api/auth/auth.dart';
import 'package:bespoke_app/utils/validator.dart';
import 'package:rxdart/rxdart.dart';

import '../../../constants/constants.dart';
import '../../../utils/api/index.dart';

class VerifyOTPBloc with Validator{
  final BaseAuth _baseAuth = Auth();

  final _verifyOTPController = StreamController<ApiResponse<Map<String, dynamic>>>.broadcast();

  Sink<ApiResponse<Map<String, dynamic>>> get verifyOTPSink => _verifyOTPController.sink;

  Stream<ApiResponse<Map<String, dynamic>>> get verifyOTPStream => _verifyOTPController.stream;

  final otpController = BehaviorSubject<String>();
  final emailController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();

  void updateOTP(String otp) {
    otpController.sink.add(otp);
  }

  void updateEmail(String email) {
    emailController.sink.add(email);
  }

  void updatePassword(String password) {
    passwordController.sink.add(password);
  }


  Stream<String> get getOTP => otpController.stream;
  Stream<String> get getEmail => emailController.stream;
  Stream<String> get getPassword => passwordController.stream;

  String get otpValue => otpController.value;
  String get emailValue => emailController.value;
  String get passwordValue => passwordController.value;


  void verifyOTP() async{

    verifyOTPSink.add(ApiResponse.loading('Please wait'));

    try{

      var response = await _baseAuth.verifyOTP({'email': emailController.value, 'otp': otpController.value, 'new_password': passwordController.value});
      if (emailController.value.isEmpty || otpController.value.isEmpty || passwordController.value.isEmpty) {
        emailController.addError(fieldRequired);
      }
      verifyOTPSink.add(ApiResponse.completed(response));
    }catch(e){
      print("OTP error$e");
      verifyOTPSink.add(ApiResponse.error(e.toString()));
      // print(e);
    }

  }


  dispose() {
    _verifyOTPController.close();
    otpController.close();
    emailController.close();
    passwordController.close();
  }
}