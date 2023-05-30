import 'package:flutter/src/widgets/framework.dart';

import '../../../auth/domain/models/auth_model.dart';


abstract class BaseAuth {
  //Future<ProfileInfo> getUser(String userId, String? token);

  Future<AuthModel> signIn(Map<String, dynamic> body);

  Future<String> getCurrentUserID();

  Future<Map<String, dynamic>> sendOTP(Map<String, dynamic> body);

  Future<Map<String, dynamic>> verifyOTP(Map<String, dynamic> body);

  Future<void> signOut(BuildContext context);
}