import 'dart:io';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:nrb_express/helper/remote/api_client.dart';
import 'package:nrb_express/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  SharedPreferences sharedPreferences ;
  ApiClient apiClient;


  AuthRepo({required this.sharedPreferences,required this.apiClient});


/* Future<Response> login({required String email, required String password}) async {
    try {

      Response response = await apiClient.postData(AppConstants.login,
        {"email": email, "password": password, "device_name":"android"},
      );
      return response;//ApiResponse.withSuccess(response);
    } catch (e) {
      print("login Failed:$e");
      return e as Response;//ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }*/
  Future<Response> login(
      {required String email, required String password}) async {
    return await apiClient
        .postData(AppConstants.login, {"email": email, "password": password,  });
  }

  Future<Response> changePass(
      {required String oldPass,required String newPass,required String confirmPass,}) async {
    return await apiClient
        .postData(AppConstants.change_password, {"old_password": oldPass, "password": newPass, "password_confirmation": confirmPass });
  }


  Future<Response> logOut() async {
    return await apiClient
        .postData(AppConstants.logout,{});
  }

  Future<Response> dashboard() async {
    return await apiClient
        .postData(AppConstants.dashboard,{});
  }




   Future<Response> rider() async {
    return await apiClient
        .postData(AppConstants.ridersDetails, {"order_type": "pending",});
  }




  Future<void> saveUserToken(String token) async {
   apiClient.updateHeader(token);
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString(AppConstants.TOKEN, token);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setLogin(bool isLogin) async{
    try {
      await sharedPreferences.setBool(AppConstants.IS_LOGIN, isLogin);
      print("Set Is Login: ${sharedPreferences.getBool(AppConstants.IS_LOGIN)}");
    } catch (e) {
      print("Set Is Login: $e");
      rethrow;
    }
  }
  Future<void> clearShareAllData() async{
      try {
        await sharedPreferences.clear();
      } catch (e) {
        rethrow;
      }
    }


  String getToken()  {
    return  sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }
 bool getIsLogin()  {
    return sharedPreferences.getBool(AppConstants.IS_LOGIN) ?? false;
  }

  Future<void> setMerchant(bool isLogin) async{
    try {
      await sharedPreferences.setBool(AppConstants.IS_Merchant, isLogin);
    } catch (e) {
      rethrow;
    }
  }


  bool getIsMerchant()  {
    return sharedPreferences.getBool(AppConstants.IS_Merchant) ?? false;
  }

}