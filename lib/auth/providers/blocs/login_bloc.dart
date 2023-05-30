import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:rxdart/rxdart.dart';

import '../../../constants/constants.dart';
import '../../../utils/api/auth/auth.dart';
import '../../../utils/api/index.dart';
import '../../../utils/validator.dart';
import '../../domain/models/index.dart';


class LoginBloc with Validator {
  final BaseAuth _baseAuth = Auth();
  final _loginController = StreamController<ApiResponse<AuthModel>>.broadcast();

  Sink<ApiResponse<AuthModel>> get loginSink => _loginController.sink;

  Stream<ApiResponse<AuthModel>> get loginStream => _loginController.stream;

  final emailController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();

  void updateEmail(String email) {
   // print(email);
    if(email.isEmpty){
      emailController.sink.addError(fieldRequired);
    }else if(!email.isValidEmail()){
      ///emailController.sink.addError(invalidEmail);
    }
    emailController.sink.add(email);
  }

  void updatePassword(String password) {
    if (password.length > 5) {
      passwordController.sink.add(password);
    } else {
      passwordController.sink
          .addError('Password must be at least 6 characters');
    }
    print(password);
  }

  Stream<String> get getEmail => emailController.stream.transform(emailValidator);
  Stream<String> get getPassword => passwordController.stream.transform(passwordValidator);

  String get emailValue => emailController.value;
  String get passwordValue => passwordController.value;




  void login() async {
    loginSink.add(ApiResponse.loading('Please wait'));

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    //androidInfo.id;
    try {
      Login login = Login(email: emailController.value, password: passwordController.value, device_name: androidInfo.id);
      AuthModel loginResponse = await _baseAuth.signIn(login.toJson());
      if (login.email.isEmpty || login.device_name.isEmpty || login.password.isEmpty) {
        emailController.addError(fieldRequired);
      }
      loginSink.add(ApiResponse.completed(loginResponse));
    } catch (e) {
      print("Login error$e");
      loginSink.add(ApiResponse.error(e.toString()));
     // print(e);
    }
  }

  dispose() {
    emailController.close();
    passwordController.close();
    _loginController.close();
  }
}