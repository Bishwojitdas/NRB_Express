import 'package:get/get_connect/http/src/response/response.dart';
import 'package:nrb_express/helper/remote/api_client.dart';
import 'package:nrb_express/utill/app_constants.dart';

class OrderRepo {
  ApiClient apiClient;

  OrderRepo({ required this.apiClient});

  Future<Response> assignOrderList(String status, int page, String? fromDate, String? toDate) async {
    return await apiClient
        .postData(AppConstants.ordersAssigned, {"status": status,"page":page, "from_date":fromDate, "to_date": toDate});
  }

  Future<Response> accountOrderList(String orderType, int page) async {
    return await apiClient
        .postData(AppConstants.ordersAccounts, {"order_type": orderType,"page":page});
  }

  Future<Response> assignOrderDetails( int orderId) async {
    return await apiClient
        .postData(AppConstants.ordersDetails, {"id": orderId,});
  }


}