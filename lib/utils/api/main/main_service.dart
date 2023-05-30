
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/appstrings.dart';
import '../api_base_helper.dart';
import 'base_main.dart';

class MainApiService implements BaseAPIService {


  final ApiBaseHelper _helper = ApiBaseHelper();

  String _tokenString = "";

  @override
  Future<Map<String, dynamic>> createTransaction(Map<String, dynamic> body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null || token.isEmpty) {
      throw Exception('Token is empty or null');
    }

    try {
      Map<String, dynamic> response = await _helper.post(createTransactionAPI, body, token) as Map<String, dynamic>;
      return response;
    } catch (error) {
      print('Error creating transaction: $error');
      rethrow; // Propagate the error to the caller
    }
  }

  @override
  Future<Map<String, dynamic>> getAllReversedTransactions() async{
    Map<String, dynamic>? response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get('token').toString();

    if (_tokenString.isNotEmpty) {
      await _helper.get(allReversedTransactionsAPI, _tokenString).then((value) {
        response = value as Map<String, dynamic>;
      }).onError((error, stackTrace) {
        return response = null;
      });

    }


    return response!;
  }

  @override
  Future<Map<String, dynamic>> getAllTransactions() async{
    Map<String, dynamic>? response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get('token').toString();

    if (_tokenString.isNotEmpty) {
      await _helper.get(allTransactionsAPI, _tokenString).then((value) {
        return response = value as Map<String, dynamic>;
      }).onError((error, stackTrace) {
        return response = { 'error': error.toString() };
      });

    }

    return response!;
  }

  @override
  Future<Map<String, dynamic>> getFailedReversedTransactions() async{
    Map<String, dynamic>? response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get('token').toString();

    if (_tokenString.isNotEmpty) {
      await _helper.get(failedReversedTransactionsAPI, _tokenString).then((value) {
        response = value as Map<String, dynamic>;
      }).onError((error, stackTrace) {
        return response = null;
      });

    }


    return response!;
  }

  @override
  Future<Map<String, dynamic>> getFailedTransactions() async{
    Map<String, dynamic>? response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get('token').toString();

    if (_tokenString.isNotEmpty) {
      await _helper.get(failedTransactionsAPI, _tokenString).then((value) {
        response = value as Map<String, dynamic>;
      }).onError((error, stackTrace) {
        return response = null;
      });

    }


    return response!;
  }

  @override
  Future<Map<String, dynamic>> getPendingReversedTransactions()  async{
    Map<String, dynamic>? response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get('token').toString();

    if (_tokenString.isNotEmpty) {
      await _helper.get(pendingReversedTransactionsAPI, _tokenString).then((value) {
        response = value as Map<String, dynamic>;
      }).onError((error, stackTrace) {
        return response = null;
      });

    }


    return response!;
  }

  @override
  Future<Map<String, dynamic>> getPendingTransactions() async{
    Map<String, dynamic>? response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get('token').toString();

    if (_tokenString.isNotEmpty) {
      await _helper.get(pendingTransactionsAPI, _tokenString).then((value) {
        response = value as Map<String, dynamic>;
      }).onError((error, stackTrace) {
        return response = null;
      });

    }


    return response!;
  }

  @override
  Future<Map<String, dynamic>> getSuccessfulReversedTransactions()  async{
    Map<String, dynamic>? response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get('token').toString();

    if (_tokenString.isNotEmpty) {
      await _helper.get(successfulReversedTransactionsAPI, _tokenString).then((value) {
        response = value as Map<String, dynamic>;
      }).onError((error, stackTrace) {
        return response = null;
      });

    }


    return response!;
  }

  @override
  Future<Map<String, dynamic>> getSuccessfulTransactions() async{
    Map<String, dynamic>? response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get('token').toString();

    if (_tokenString.isNotEmpty) {
      await _helper.get(successfulTransactionsAPI, _tokenString).then((value) {
        response = value as Map<String, dynamic>;
      }).onError((error, stackTrace) {
        return response = null;
      });

    }


    return response!;
  }

  @override
  Future<Map<String, dynamic>> reverseTransaction(Map<String, dynamic> body) async {
    Map<String, dynamic>? response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get('token').toString();

    if (_tokenString.isNotEmpty) {
      await _helper.post(reverseTransactionAPI, body, _tokenString).then((value) {
        response = value as Map<String, dynamic>;
      }).onError((error, stackTrace) {
        return response = null;
      });

    }


    return response!;
  }
 
}