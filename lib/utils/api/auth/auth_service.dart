import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../auth/index.dart';
import '../../../constants/constants.dart';

import '../../utils.dart';
import '../api_base_helper.dart';
import 'base_auth.dart';

class Auth implements BaseAuth {
  final ApiBaseHelper _helper = ApiBaseHelper();
  String _tokenString = "";
  String _userId = "";

  @override
  Future<String> getCurrentUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get('token').toString();
    _userId = prefs.get('userId').toString();
    if (_userId.isEmpty &&  _tokenString.isNotEmpty) {
      final response = await _helper.post(loginAPI, {
        'refresh_token': prefs.get('refresh_token').toString(),
      }, _tokenString);
    }else{
      if (kDebugMode) {
        print ('UserId: $_userId');
      }
    }
    return _userId;
  }

  @override
  Future<AuthModel> signIn(Map<String, dynamic> body) async {
    final response = await _helper.post(loginAPI, body, null);
    return AuthModel.fromJson(response as Map<String, dynamic>);

  }


  @override
  Future<void> signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('refresh_token');
    prefs.remove('userId');
    prefs.remove('email');
    Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (context) => const AuthScreen()), (route) => false);

  }

  @override
  Future<Map<String, dynamic>> sendOTP(Map<String, dynamic> body) async {
    Map<String, dynamic>? response;
    await _helper.post(sendOTPAPI, body, null).then((value) {
      response = value as Map<String, dynamic>;
    }).onError((error, stackTrace) {
      return response = null;
    });

    return response!;
  }

  @override
  Future<Map<String, dynamic>> verifyOTP(Map<String, dynamic> body) async{

    Map<String, dynamic>? response;
    await _helper.post(verifyOTPAPI, body, null).then((value) {
      response = value as Map<String, dynamic>;
    })
    .onError((error, stackTrace) {
      print("Error: $error");
      print("Stack Trace: $stackTrace");

      response = response?.map((key, value) => MapEntry('message', value.toString()));

    });
   return response!;
  }

}
