import 'dart:async';


import 'package:rxdart/rxdart.dart';

import '../../../constants/constants.dart';
import '../../../utils/api/api_response.dart';
import '../../../utils/api/auth/auth.dart';
import '../../../utils/api/index.dart';
import '../../../utils/validator.dart';
import '../../domain/index.dart';

class OTPBloc with Validator{

  final BaseAuth _baseAuth = Auth();
  final _otpController = StreamController<ApiResponse<Map<String, dynamic>>>.broadcast();

  Sink<ApiResponse<Map<String, dynamic>>> get otpSink => _otpController.sink;

  Stream<ApiResponse<Map<String, dynamic>>> get otpStream => _otpController.stream;

  final emailController = BehaviorSubject<String>();

  void updateEmail(String email) {
    emailController.sink.add(email);
  }

  Stream<String> get getEmail => emailController.stream.transform(emailValidator);
void sendOTP() async{

  otpSink.add(ApiResponse.loading('Please wait'));


  try{
    var response = await _baseAuth.sendOTP({'email': emailController.value});
    if (emailController.value.isEmpty) {
      emailController.addError(fieldRequired);
    }
    otpSink.add(ApiResponse.completed(response));
  } catch (e) {
    print("OTP error$e");
    otpSink.add(ApiResponse.error(e.toString()));
    // print(e);
  }
}




}