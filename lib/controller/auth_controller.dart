import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nrb_express/data/model/base/response_model.dart';
import 'package:nrb_express/data/model/dashboard_model.dart';
import 'package:nrb_express/data/model/log_out_model.dart';
import 'package:nrb_express/data/model/login_response.dart';
import 'package:nrb_express/data/model/rider_details_model.dart';
import 'package:nrb_express/data/repository/auth_repo.dart';

class AuthController extends GetxController{
AuthRepo authRepo;

AuthController({required this.authRepo});

RiderDetailsData? _riderDetailsData=null;
RiderDetailsData? get riderDetailsData=>_riderDetailsData;


  Future<ResponseModel> login(String email, String password) async {
    Response apiResponse = await authRepo.login(email: email, password: password) as Response;
    ResponseModel responseModel;
    if (apiResponse.statusCode == 200) {
      LoginResponse loginResponse= LoginResponse.fromJson(apiResponse.body);
      String token = loginResponse.token;//map["token"];
      int? userId = loginResponse.id;//map["token"];
      authRepo.saveUserToken(token);
     await authRepo.setLogin(true);
      await authRepo.setMerchant(false);

      responseModel = ResponseModel(true, 'successful');

    }
    else {
      responseModel = ResponseModel(false, "Failed!");
    }

    return responseModel;
  }

  Future<ResponseModel> changePass(String oldPassword, String password,String confirmPassword) async {
    Response apiResponse = await authRepo.changePass(oldPass: oldPassword, newPass: password, confirmPass: confirmPassword) as Response;
    ResponseModel responseModel;
    if (apiResponse.statusCode == 200) {
      responseModel = ResponseModel(true, 'successful');
    }
    else {
      responseModel = ResponseModel(false, "Failed!");
    }

    return responseModel;
  }


Future<ResponseModel> logOut() async {
    Response apiResponse = await authRepo.logOut() as Response;
    ResponseModel responseModel;
    if (apiResponse.statusCode == 200) {
      LogOut loginResponse= LogOut.fromJson(apiResponse.body);
      authRepo.saveUserToken("");
     await authRepo.setLogin(false);
      await authRepo.setMerchant(false);

      responseModel = ResponseModel(true, '${loginResponse.message}');

    }
    else {
      responseModel = ResponseModel(false, "Failed!");
    }

    return responseModel;
  }
DashboardData? _dashboardData;
DashboardData? get dashboardData=>_dashboardData;
Future<ResponseModel> dashBoardData() async {
    Response apiResponse = await authRepo.dashboard() as Response;
    ResponseModel responseModel;
    if (apiResponse.statusCode == 200) {
      _dashboardData= DashboardResponse.fromJson(apiResponse.body).data;

      responseModel = ResponseModel(true, 'Success');

    }
    else {
      responseModel = ResponseModel(false, "Failed!");
    }
    update();
    return responseModel;
  }



  Future<ResponseModel> getRider() async {
    EasyLoading.show(status: 'processing...');
    Response response = await authRepo.rider() as Response;
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      _riderDetailsData=RiderDetailsResponse.fromJson(response.body).data;
      debugPrint("Rider Details: $_riderDetailsData");
      responseModel = ResponseModel(true, response.body[0].toString());

    } else {
      responseModel = ResponseModel(false, response.body["email"][0].toString());

    }
    EasyLoading.dismiss();
    update();
    return responseModel;
  }


 Future<void> setIsLogin(bool isLogin) async{
    await authRepo.setLogin(isLogin);
  }

  Future<void> clearSharedData() async{
      await authRepo.clearShareAllData();
  }

  bool getIsLogin()  {
    return  authRepo.getIsLogin() ;
  }

  Future<void> setIsMerchant(bool isLogin) async{
    await authRepo.setMerchant(isLogin);
  }

bool getIsMerchant()  {
    return  authRepo.getIsMerchant() ?? false;
  }

}