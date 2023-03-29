import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nrb_express/helper/remote/exception.dart';
import 'package:nrb_express/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
   String appBaseUrl="https://apirider.nrbxpress.com/api/v1";
  final SharedPreferences sharedPreferences;

  String? token;
  Map<String, String>? _mainHeaders;

  ApiClient({required this.appBaseUrl,
    required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = sharedPreferences.getString(AppConstants.TOKEN);
     debugPrint('Base URL: $baseUrl');
    _mainHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeader(String? token) {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }



  Future<Response> getSpotifySongsList(String token, String query ) async {
    final response = await http.get(Uri.parse("https://api.spotify"
        ".com/v1/search?q="+ query + "&type=track&limit=22"),
        headers: {
         // "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer $token"
        }
    );

    debugPrint('-> token -> ${token}');
    debugPrint('---GetX Response>>${response.body}');
    return Response(statusCode: response.statusCode,
        body: response.body);
  }


  Future<Response> getData(
    String uri, {
    Map<String, dynamic>? query,
    String? contentType,
    Map<String, String>? headers,
    Function(dynamic)? decoder,
  }) async {
    try {
      if (Foundation.kDebugMode) {
         debugPrint('====> GetX Call: $uri\nToken: $token');
      }
      DateTime time = DateTime.now();
      var loggerRespRcvTime = time.millisecondsSinceEpoch;
      Response response = await get(
        uri,
        contentType: contentType,
        query: query,
        headers: headers ?? _mainHeaders,
        decoder: decoder,
      );
     /* var link =  baseUrl.toString()  + uri + query.toString();
      Get.find<LoggerController>().
      saveLog(link, response.statusCode ?? -10  ,response: response.bodyString , isTimeOut: false ,
      loggerRespSendTime: loggerRespRcvTime , reqType: "GET" );*/


      response = handleResponse(response);

      if (Foundation.kDebugMode) {
        debugPrint(
            '====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
        debugPrint(
            '====> GetX Response: [${_mainHeaders}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(
    String uri,
    var body, {
    Map<String, dynamic>? query,
    String? contentType,
    Map<String, String>? headers,
    Function(dynamic)? decoder,
    Function(double)? uploadProgress,
  }) async {
    try {
      if (Foundation.kDebugMode) {
        debugPrint('====> GetX Call: $uri\nToken: $token');
        debugPrint('====> GetX Body: $body');
      }

      DateTime time = DateTime.now();
      var loggerRespRcvTime = time.millisecondsSinceEpoch;
      Response response = await post(
        uri,
        body,
        query: query,
        contentType: contentType,
        headers: headers ?? _mainHeaders,
        decoder: decoder,
        uploadProgress: uploadProgress,
      );

     /* var link =  baseUrl.toString()  + uri + query.toString();
      Get.find<LoggerController>().
      saveLog(link, response.statusCode ?? -10  ,response: response.bodyString , isTimeOut: false ,
          loggerRespSendTime: loggerRespRcvTime , reqType: "GET" );*/

     // response = handleResponse(response);
      if (Foundation.kDebugMode) {
        debugPrint(
            '====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> putData(
    String uri,
    dynamic body, {
    Map<String, dynamic>? query,
    String? contentType,
    Map<String, String>? headers,
    Function(dynamic)? decoder,
    Function(double)? uploadProgress,
  }) async {
    try {
      if (Foundation.kDebugMode) {
        // debugPrint('====> GetX Call: $uri\nToken: $token');
        debugPrint('====> GetX Body: $body');
      }
      Response response = await put(
        uri,
        body,
        query: query,
        contentType: contentType,
        headers: headers ?? _mainHeaders,
        decoder: decoder,
        uploadProgress: uploadProgress,
      );
      response = handleResponse(response);
      if (Foundation.kDebugMode) {
        debugPrint(
            '====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> deleteData(
    String uri, {
    Map<String, dynamic>? query,
    String? contentType,
    Map<String, String>? headers,
    Function(dynamic)? decoder,
  }) async {
    try {
      if (Foundation.kDebugMode) {
        // debugPrint('====> GetX Call: $uri\nToken: $token');
      }
      Response response = await delete(
        uri,
        headers: headers ?? _mainHeaders,
        contentType: contentType,
        query: query,
        decoder: decoder,
      );
      response = handleResponse(response);
      if (Foundation.kDebugMode) {
        debugPrint(
            '====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Response handleResponse(Response response) {
    Response _response = response;
    if (_response.hasError &&
        _response.body != null &&
        _response.body is! String) {
      if (_response.body.toString().startsWith('{errors: [{code:')) {
        ErrorClass _errorResponse = ErrorClass.fromJson(_response.body);
        _response = Response(
            statusCode: _response.statusCode,
            body: _response.body,
            statusText: _errorResponse.errors![0].message);
      } else if (_response.body.toString().startsWith('{message')) {
        _response = Response(
            statusCode: _response.statusCode,
            body: _response.body,
            statusText: _response.body['message']);
      }
    } else if (_response.hasError && _response.body == null) {
      _response = const Response(
          statusCode: 0,
          statusText:
              'Connection to API server failed due to internet connection');
    }
    return _response;
  }
}
