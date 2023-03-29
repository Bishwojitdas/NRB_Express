import 'package:get/get.dart';
import 'package:nrb_express/controller/account_order_controller.dart';
import 'package:nrb_express/controller/auth_controller.dart';
import 'package:nrb_express/controller/order_controller.dart';
import 'package:nrb_express/data/repository/account_order_repo.dart';
import 'package:nrb_express/data/repository/auth_repo.dart';
import 'package:nrb_express/data/repository/order_repo.dart';
import 'package:nrb_express/helper/remote/api_client.dart';
import 'package:nrb_express/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  // Repository
  // Get.lazyPut(() => XMPPRepo());
  Get.lazyPut(() => AuthRepo(sharedPreferences: Get.find(), apiClient: Get.find()));
  Get.lazyPut(() => OrderRepo( apiClient: Get.find()));
  Get.lazyPut(() => AccountOrderRepo( apiClient: Get.find()));

  /// Controller
 // Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
 // Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find(),));
  Get.lazyPut(() => OrderController(orderRepo: Get.find(),));
  Get.lazyPut(() => AccountOrderController(orderRepo: Get.find(),));

// =======
  //Get.lazyPut(() => ChatController(chatRepo: Get.find()));
  //Get.lazyPut(() => AuthController(chatRepo: Get.find(), authRepo: Get.find()));
// >>>>>>> develop

 // Get.lazyPut(() => LoggerController());
}
