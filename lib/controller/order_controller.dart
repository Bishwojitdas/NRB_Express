
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nrb_express/data/model/account_order_model.dart';
import 'package:nrb_express/data/model/assign_order_model.dart';
import 'package:nrb_express/data/model/base/response_model.dart';
import 'package:nrb_express/data/model/order_details_model.dart';
import 'package:nrb_express/data/model/order_model.dart';
import 'package:nrb_express/data/repository/order_repo.dart';
import 'package:nrb_express/helper/pagination_filter.dart';

class OrderController extends GetxController{
  OrderRepo orderRepo;

  OrderController({ required this.orderRepo});

  List<OrdersModel> orderList=[
    OrdersModel(trackId: 149269856, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Rakibul Hasan", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
    OrdersModel(trackId: 269149857, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Parcel",   receiverName: "Abul Kashem", receiverAddress: "Bdbl Road, Dhanmondi", receiverPhone: "01532965325",orderDate: "Apr 10,2020",orderStatus: "Pending"),
    OrdersModel(trackId: 198564926, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Mahmudul Hasan", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
    OrdersModel(trackId: 185492696, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Robiul Hasan", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
    OrdersModel(trackId: 126499858, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Iftekhar Hossain", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
    OrdersModel(trackId: 149269859, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Rakibul Hasan", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
    OrdersModel(trackId: 1926948560, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Mohibul Hoque", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
    OrdersModel(trackId: 1269849561, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Rakibul Hasan", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
    OrdersModel(trackId: 1492698562, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Rakibul Hasan", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
    OrdersModel(trackId: 2691498563, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Parcel",   receiverName: "Abul Kashem", receiverAddress: "Bdbl Road, Dhanmondi", receiverPhone: "01532965325",orderDate: "Apr 10,2020",orderStatus: "Pending"),
    OrdersModel(trackId: 1985649264, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Mahmudul Hasan", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
    OrdersModel(trackId: 1854926965, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Robiul Hasan", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
    OrdersModel(trackId: 1264998566, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Iftekhar Hossain", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
    OrdersModel(trackId: 149269856, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Rakibul Hasan", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
    OrdersModel(trackId: 192694856, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Mohibul Hoque", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
    OrdersModel(trackId: 126984956, senderName: "Hazi Textile", paymentType: "Cash on Delivery",orderType: "Document", receiverName: "Rakibul Hasan", receiverAddress: "257 Shekshaheb Bazar Road", receiverPhone: "01965325325",orderDate: "Apr 20,2021",orderStatus: "Pending"),
  ].obs;

  RxList<bool?> isSelected= List.filled(16, false, growable: false).obs;

  changeSelection(int index){

  }

  var _paginationFilter = PaginationFilter().obs;
  bool _lastPage = false;


  var selectedFromDate = DateTime(2022, 01,01).obs;
  var selectedToDate = DateTime.now().obs;
  final DateFormat format = DateFormat('yyyy-MM-dd');
  String? get  fromDate=> format.format(selectedFromDate.value) ?? "";
  String? get  toDate=> format.format(selectedToDate.value) ?? "";

  TextEditingController fromDateController=TextEditingController();
  TextEditingController toDateController=TextEditingController();



  int? get limit => _paginationFilter.value.limit;
  int get page => _paginationFilter.value.page;
  bool get lastPage => _lastPage;
  int currentPage=1;

  List<AssignOrderData>? _assignOrderList=<AssignOrderData>[].obs;
  List<AssignOrderData>? get getAssignOrderList=>_assignOrderList;
  String status="delivered";

  @override
  onInit() {
    ever(_paginationFilter, (_) => assignOrderList(status,page, fromDate, toDate));
   // _changePaginationFilter(page+1, 3);
    print("Curent Page:$page");
    super.onInit();
  }

  void changeTotalPerPage(int limitValue) {
    _assignOrderList?.clear();
    _lastPage = false;
    _changePaginationFilter(page, limitValue);
    update();
  }

  void _changePaginationFilter(int page, int? limit) {
    _paginationFilter.update((val) {
      val?.page = page;
      val?.limit = 10;
    });
    print("Curent Page:$page");
  }

  void loadNextPage(){
    ever(_paginationFilter, (_) => assignOrderList(status,page, fromDate, toDate));
    _changePaginationFilter(page+1, limit);

  }

  Future<DateTime?> getDate(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Colors.green,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
  }

  chooseFromDate(BuildContext context) async {
    DateTime? pickedDate = await getDate(context);
    if (pickedDate != null && pickedDate != selectedFromDate.value) {
      selectedFromDate.value = pickedDate;
      fromDateController.text=fromDate.toString();
      update();
    }

  }
  chooseToDate(BuildContext context) async {
    DateTime? pickedDate = await getDate(context);
    if (pickedDate != null && pickedDate != selectedToDate.value) {
      selectedToDate.value = pickedDate;
      toDateController.text=toDate.toString();
      update();
    }

  }

  dateWiseSearch(){
    _assignOrderList?.clear();
    ever(_paginationFilter, (_) => assignOrderList(status,page, fromDate, toDate));
     _changePaginationFilter(1, 10);
     update();
  }

    bool disableDate(DateTime day) {
      if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
          day.isBefore(DateTime.now().add(Duration(days: 5))))) {
        return true;
      }
      return false;
    }


    Future<ResponseModel> assignOrderList(String status, int page, String? fromDate, String? toDate) async {
   // EasyLoading.show(status: 'Loading Data...');
    update();
    Response response = await orderRepo.assignOrderList(status, page, fromDate, toDate ) ;
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      AssignOrderResponse assignOrder=AssignOrderResponse.fromJson(response.body);
      assignOrder.data.forEach((element) {
        _assignOrderList!.add(element);
      });
      _changePaginationFilter(assignOrder.meta.currentPage+1, assignOrder.meta.lastPage);
      if(assignOrder.meta.currentPage==assignOrder.meta.lastPage){
        _lastPage=true;
      }
      debugPrint("Assign Order List: $_assignOrderList");
      responseModel = ResponseModel(true, "Success");

    } else {
      responseModel = ResponseModel(false, "Failed");

    }
   // EasyLoading.dismiss();
    update();
    return responseModel;
  }

  List<AccountOrderData> _accountsOrderList=<AccountOrderData>[].obs;
  List<AccountOrderData> get accountsOrderList=>_accountsOrderList;

  Future<ResponseModel> accountOrderList(String orderType, int page) async {
   // EasyLoading.show(status: 'Loading Data...');
    update();
    Response response = await orderRepo.accountOrderList(orderType, page) ;
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      AccountOrderResponse assignOrder=AccountOrderResponse.fromJson(response.body);
      assignOrder.data.forEach((element) {
        _accountsOrderList.add(element);
      });

     // _changePaginationFilter(assignOrder.meta.currentPage+1, assignOrder.meta.lastPage);
      if(assignOrder.meta.currentPage==assignOrder.meta.lastPage){
        _lastPage=true;
      }
      debugPrint("Assign Order List: $_assignOrderList");
      responseModel = ResponseModel(true, "Success");

    } else {
      responseModel = ResponseModel(false, "Failed");
    }
   // EasyLoading.dismiss();
    update();
    return responseModel;
  }


  OrderDetailsData? _orderDetailsData;
  OrderDetailsData? get getOrderDetailsData=>_orderDetailsData;

   Future<ResponseModel> assignOrderDetails( int orderId) async {
    EasyLoading.show(status: 'processing...');
    update();
    Response response = await orderRepo.assignOrderDetails(orderId, ) ;
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      _orderDetailsData=OrderDetailsResponse.fromJson(response.body).data;
      debugPrint("Assign Order Details: $_orderDetailsData");
      responseModel = ResponseModel(true, "Success");

    } else {
      responseModel = ResponseModel(false, "Failed");

    }
    EasyLoading.dismiss();
    update();
    return responseModel;
  }

}