import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nrb_express/controller/auth_controller.dart';


class ApiChecker {
  static void checkApi(Response response) {
    if(response.statusCode == 401) {
      Get.find<AuthController>().clearSharedData();
     // Get.offAllNamed(RouteHelper.getSignInRoute());
    }else {
      EasyLoading.showToast(response.statusText.toString());
    }
  }
}


