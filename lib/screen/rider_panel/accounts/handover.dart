import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:nrb_express/controller/account_order_controller.dart';
import 'package:nrb_express/controller/order_controller.dart';
import 'package:nrb_express/screen/merchant_panel/orders.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/styles.dart';

class HandOver extends StatefulWidget {
  const HandOver({Key? key}) : super(key: key);

  @override
  _HandOverState createState() => _HandOverState();
}

class _HandOverState extends State<HandOver> {

  AccountOrderController orderController=Get.find<AccountOrderController>();

  bool allSelect=false;
  @override
  void initState() {
    // TODO: implement initState
    orderController.dateWiseSearch("handed_over");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        body: ListView(
          children: [
            const SizedBox(height: 10,),
            GetBuilder<AccountOrderController>(
              builder:(order)=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorResources.COLOR_PRIMARY_RIDER
                        ),
                        child: IconButton(onPressed: () {
                          order.dateWiseSearch("handed_over");
                        },
                            icon: const Icon(Icons.search, color: Colors.white,size: 20,))
                    ),
                  ),
                ],
              ),
            ),

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
                      Row(
                        children: [
                          Checkbox(
                            value: allSelect,
                            onChanged: (value){
                              setState(() {
                                allSelect=value as bool;
                                orderController.selectAll(value);
                              });

                            },
                          ),
                          Text("All", style: LatoBlack.copyWith(fontSize: 18),),
                        ],
                      ),
                      Text("SENDER", style: LatoBlack.copyWith(fontSize: 18),),
                      Text("RECEIVER", style: LatoBlack.copyWith(fontSize: 18),),
                      Text("STATUS", style: LatoBlack.copyWith(fontSize: 18),)
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10,),

          GetBuilder<AccountOrderController>(
              builder: (orderController) {
                return  orderController.accountsOrderList!=null ? LazyLoadScrollView(
                  onEndOfPage: orderController.loadNextPage,
                  isLoading: orderController.lastPage,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/1.55,
                    child: ListView.builder(
                      itemCount: orderController.accountsOrderList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      value: orderController.isSelected![index],
                                      onChanged: (value){
                                        setState(() {
                                          orderController.isSelected![index]=value;
                                        });

                                      },
                                    ),

                                    SizedBox(
                                      width: Get.width/3.7,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 2),
                                            child: Text("${orderController.accountsOrderList[index].id}",style: LatoBlack),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 2),
                                            child: Text("${orderController.accountsOrderList[index].sender}",style: LatoRegular),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 2),
                                            child: Text("${orderController.accountsOrderList[index].senderAddress}",style: LatoRegular.copyWith(overflow: TextOverflow.ellipsis)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 2),
                                            child: Text("${orderController.accountsOrderList[index].paymentMethod}", style: LatoRegular,),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 2),
                                            child: Text("${orderController.accountsOrderList[index].shipmentItemType}", style: LatoRegular,),
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
                                            child: Text("${orderController.accountsOrderList[index].recieverName}",style: LatoRegular),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 2),
                                            child: Text("${orderController.accountsOrderList[index].receiverAddress}",style: LatoRegular),
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
                                                  child: Text("${orderController.accountsOrderList[index].recieverPhone}", style: LatoBlack,)),
                                            ],
                                          ),
                                          const Padding(
                                            padding:  EdgeInsets.symmetric(vertical: 2),
                                            child: Text("Amount: 60Tk", style: LatoRegular,),
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
                                            child: Text("${orderController.accountsOrderList[index].date}",style: LatoRegular),
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
                                                      child: Text("Hand Over", style: LatoBlack.copyWith(
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
                        );
                      },
                    ),
                  ),
                ):Center(child: CircularProgressIndicator());
              }
          ),

          ],
        ),
      ),
    );
  }
}
