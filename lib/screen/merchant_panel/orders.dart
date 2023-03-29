import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:nrb_express/controller/order_controller.dart';
import 'package:nrb_express/screen/rider_panel/order_deratils.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/styles.dart';


class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  OrderController orderController=Get.find<OrderController>();

  @override
  void initState() {
    // TODO: implement initState
    //orderController.assignOrderList("delivered", 3);
    orderController.dateWiseSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        appBar: AppBar(
          backgroundColor: ColorResources.COLOR_PRIMARY_RIDER,
          title: const Text("ORDERS"),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 20,),
            GetBuilder<OrderController>(
              builder:(order)=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            order.chooseFromDate(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              height: 40,
                              width: FullWidth(context)/4,
                              child: Text("${order.fromDate}", ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            order.chooseToDate(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              height: 40,
                              width: FullWidth(context)/20,
                              child: Text("To", style: LatoBold, ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            order.chooseToDate(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                            child: SizedBox(
                              height: 40,
                              width: FullWidth(context)/4,
                              child: Text("${order.toDate}", ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorResources.COLOR_PRIMARY_RIDER
                        ),
                        child: IconButton(onPressed: () {
                          order.dateWiseSearch();
                        },
                            icon: const Icon(Icons.search, color: Colors.white,size: 25,))
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 50,
                width: Get.width,
                decoration: const BoxDecoration(
                    color: Colors.grey
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("SENDER", style: LatoBlack.copyWith(fontSize: 18),),
                      Text("RECEIVER", style: LatoBlack.copyWith(fontSize: 18),),
                      Text("STATUS", style: LatoBlack.copyWith(fontSize: 18),)
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10,),

            GetBuilder(
              init: orderController,
                builder:(orderController) =>  orderController.getAssignOrderList!=null ? LazyLoadScrollView(
                     onEndOfPage: orderController.loadNextPage,
                     isLoading: orderController.lastPage,
                     child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.55,
              child: ListView.builder(
                itemCount: orderController.getAssignOrderList!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: (){
                        Get.to(()=>OrderDetails( assignOrderData: orderController.getAssignOrderList![index],));
                      },
                      child: Column(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width/3.7,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 2),
                                          child: Text("${orderController.getAssignOrderList?[index].id}",style: LatoBlack),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 2),
                                          child: Text("${orderController.getAssignOrderList?[index].sender}",style: LatoRegular),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 2),
                                          child: Text("${orderController.getAssignOrderList?[index].paymentMethod}", style: LatoRegular,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 2),
                                          child: Text("${orderController.getAssignOrderList?[index].shipmentItemType}", style: LatoRegular,),
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width/3.6,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 2),
                                          child: Text("${orderController.getAssignOrderList?[index].recieverName}",style: LatoRegular),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 2),
                                          child: Text("${orderController.getAssignOrderList?[index].receiverAddress}",style: LatoRegular),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const  Padding(
                                              padding:  EdgeInsets.all(1),
                                              child: Icon(Icons.add_call, size: 16,),
                                            ),
                                            SizedBox(
                                                width: Get.width/4.5,
                                                child: Text("${orderController.getAssignOrderList?[index].recieverPhone}", style: LatoBlack,)),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width/4.2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 2),
                                          child: Text("${orderController.getAssignOrderList?[index].date}",style: LatoRegular),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 2),
                                          child: Text("${orderController.getAssignOrderList?[index].amount} Tk",style: LatoRegular),
                                        ),
                                        InkWell(
                                            onTap: () {

                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 3),
                                              child: Container(
                                                  width: Get.width/4.5,
                                                  decoration: BoxDecoration(
                                                    color: ColorResources.COLOR_PRIMARY_RIDER,
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text("${orderController.getAssignOrderList?[index].status}", style: LatoBlack.copyWith(
                                                        color: Colors.white
                                                    ),textAlign: TextAlign.center),
                                                  )
                                              ),
                                            )
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  );
                },
              ),
            ),
            ): Center(child: CircularProgressIndicator())
            ),

          ],
        ),
      ),
    );
  }
}

FullWidth(BuildContext context) {
  return Get.width;
}
