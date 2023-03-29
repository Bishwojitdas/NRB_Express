
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nrb_express/data/model/account_order_model.dart';
import 'package:nrb_express/data/model/base/response_model.dart';
import 'package:nrb_express/data/model/order_details_model.dart';
import 'package:nrb_express/data/repository/account_order_repo.dart';
import 'package:nrb_express/helper/pagination_filter.dart';

class AccountOrderController extends GetxController{
  AccountOrderRepo orderRepo;

  AccountOrderController({ required this.orderRepo});

  RxList<bool?>? isSelected= <bool>[].obs;

  changeSelection(int index){

  }

  var _paginationFilter = PaginationFilter().obs;
  bool _lastPage = false;


  var selectedFromDate = DateTime(2022, 01,01).obs;
  var selectedTomDate = DateTime.now().obs;
  final DateFormat format = DateFormat('yyyy-MM-dd');
  String? get  fromDate=> format.format(selectedFromDate.value) ?? "";
  String? get  toDate=> format.format(selectedTomDate.value) ?? "";

  TextEditingController fromDateContrroller=TextEditingController();
  TextEditingController toDateContrroller=TextEditingController();

  List<AccountOrderData> _accountsOrderList=<AccountOrderData>[].obs;
  List<AccountOrderData> get accountsOrderList=>_accountsOrderList;

  int? get limit => _paginationFilter.value.limit;
  int get page => _paginationFilter.value.page;
  bool get lastPage => _lastPage;

  String orderType="not_yet_handed_over";
  @override
  onInit() {
    ever(_paginationFilter, (_) => accountOrderList(orderType,page, fromDate, toDate));
   // _changePaginationFilter(page+1, 3);
    print("Curent Page:$page");
    super.onInit();
  }

  void changeTotalPerPage(int limitValue) {
    _accountsOrderList.clear();
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
    ever(_paginationFilter, (_) => accountOrderList(orderType,page, fromDate, toDate));
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
      fromDateContrroller.text=fromDate.toString();
      update();
    }

  }
  chooseToDate(BuildContext context) async {
    DateTime? pickedDate = await getDate(context);
    if (pickedDate != null && pickedDate != selectedTomDate.value) {
      selectedTomDate.value = pickedDate;
      toDateContrroller.text=toDate.toString();
      update();
    }

  }

  dateWiseSearch(String orderType){
    _accountsOrderList.clear();
    _changePaginationFilter(1, 10);
    orderType=orderType;
    ever(_paginationFilter, (_) => accountOrderList(orderType,page, fromDate, toDate));
     update();
  }

    bool disableDate(DateTime day) {
      if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
          day.isBefore(DateTime.now().add(Duration(days: 5))))) {
        return true;
      }
      return false;
    }

    selectAll(bool value){
    isSelected?.forEach((element) {
      isSelected?.add(value);
    });
    update();
    }

  Future<ResponseModel> accountOrderList(String orderType, int page, String? fromDate, String? toDate ) async {
   // EasyLoading.show(status: 'Loading Data...');
    Response response = await orderRepo.accountOrderList(orderType, page, fromDate, toDate) ;
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      AccountOrderResponse assignOrder=AccountOrderResponse.fromJson(response.body);
      assignOrder.data.forEach((element) {
        _accountsOrderList.add(element);
        isSelected?.add(false);
      });

     // _changePaginationFilter(assignOrder.meta.currentPage+1, assignOrder.meta.lastPage);
      if(assignOrder.meta.currentPage==assignOrder.meta.lastPage){
        _lastPage=true;
      }
      debugPrint("Account Order List: $_accountsOrderList");
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