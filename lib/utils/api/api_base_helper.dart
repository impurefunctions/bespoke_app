import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bespoke_app/utils/api/index.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../constants/constants.dart';


dynamic _returnResponse(http.Response response) {
  //print(response.statusCode);
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      //print(responseJson);
      return responseJson;
    case 201:
      var responseJson = json.decode(response.body.toString());
      //print(responseJson);
      return responseJson;
    case 400:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
      //throw BadRequestException(response.body.toString());
      //throw BadRequestException(response.body.toString());
    case 401:
    //throw UnauthorisedException(response.body.toString());
      var responseJson = json.decode(response.body.toString());
      // //print(responseJson);
      return responseJson;
    case 403:
      var responseJson = json.decode(response.body.toString());
      // //print(responseJson);
      return responseJson;
    case 409:
      throw ConflictException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

class ApiBaseHelper {


  var client = http.Client();

  Future<dynamic> delete(String url) async {
    var apiResponse;
    try {
      final response = await client.delete(Uri.parse(url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      //print('No net');
      throw FetchDataException('No Internet connection');
    }
    //print('api delete.');
    return apiResponse;
  }

  Future<dynamic> get(String url, String? token) async {
    if (kDebugMode) {
      print('Api Get, url ${baseURL + url}');
      print("Api Get, token $token");
    }

    var responseJson;
    try {
      final response = await client.get(Uri.parse(baseURL + url), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (kDebugMode) {
        print(' response Code: ${response.statusCode}');
      }
      responseJson = _returnResponse(response);
    } on SocketException {
      //print('No net');
      throw FetchDataException('No Internet connection');
    }
    //print('api get received!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body, String? token) async {
    // //print('Api Post, url $url ${jsonEncode(body)}');
    // //print(body);
    var responseJson;
    if (kDebugMode) {
      print('token: $token');
    }
    try {
      final response = await client.post(
        Uri.parse(baseURL + url),
        body: jsonEncode(body),
        headers: <String, String>{
          'accept': 'application/json; charset=UTF-8',
          'content-type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (kDebugMode) {
        print(response.body);
        print('response.statusCode ${response.statusCode}');
      }

      responseJson = _returnResponse(response);
    } catch(e,stackTrace){
      print("Error Caught: $e");
      print("Stack Trace: $stackTrace");

      responseJson = _returnResponse;

    }
    /*on SocketException {
      //print('No net');
      throw FetchDataException('No Internet connection');
    } on UnauthorisedException {
      throw FetchDataException(responseJson.hashCode.toString());
    }*/
    //print('api post.');
    return responseJson;
  }



  Future<dynamic> put(String url, dynamic body, String? token) async {
    if (kDebugMode) {
      print('Api Put, url ${baseURL + url}');
      print('Token: $token');
    }

    var responseJson;
    try {
      final response = await client.put(Uri.parse(baseURL + url),
        body: jsonEncode(body),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        },
        encoding: Encoding.getByName("utf-8"),
      );
      if (kDebugMode) {
        print(response.body);
        print('response.statusCode ${response.statusCode}');
      }

      responseJson = _returnResponse(response);
    } on SocketException {
      if (kDebugMode) {
        print('No net');
      }


      throw FetchDataException('No Internet connection');
    }
    if (kDebugMode) {
      print('api put.');
      print('Put Response:$responseJson');
    }

    return responseJson;
  }
}
