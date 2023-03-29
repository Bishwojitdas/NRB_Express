import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrb_express/controller/billing_controller.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/styles.dart';



class Billing extends StatefulWidget {
  const Billing({Key? key}) : super(key: key);

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  BillingController billingController=Get.put(BillingController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.2),
        appBar: AppBar(
          backgroundColor: ColorResources.COLOR_PRIMARY,
          leading: IconButton(onPressed: (){},
              icon: const Icon(Icons.arrow_back, size: 30,)),
          title: const Text("BILLING",),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 5,),
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
                      Text("ORDER INFO", style: LatoBlack.copyWith(fontSize: 18),),
                      Text("RECEIVER", style: LatoBlack.copyWith(fontSize: 18),),
                      Text("STATUS", style: LatoBlack.copyWith(fontSize: 18),)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Obx(() => SizedBox(
              width: Get.width,
              height: Get.height/1.4,
              child: ListView.builder(
                itemCount: billingController.billingList.length,
                itemBuilder: (context, index) {
                  return Column(
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
                                      child: Text("${billingController.billingList[index].trackId}",style: LatoBlack),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2),
                                      child: Text("COD: ${billingController.billingList[index].cod}",style: LatoRegular),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2),
                                      child: Text("Xpress fee: ${billingController.billingList[index].xpressFee}", style: LatoRegular,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2),
                                      child: Text("Paid amount: ${billingController.billingList[index].paidAmount}", style: LatoRegular,),
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
                                      child: Text("${billingController.billingList[index].receiverName}",style: LatoRegular),
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
                                            child: Text("${billingController.billingList[index].reciverPhone}", style: LatoBlack,)),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2),
                                      child: Text("${billingController.billingList[index].paymentType}",style: LatoRegular),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Get.width/4.2,
                                child: InkWell(
                                    onTap: () {

                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 3),
                                      child: Container(
                                          width: Get.width/4.5,
                                          decoration: BoxDecoration(
                                            color: ColorResources.COLOR_PRIMARY,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("${billingController.billingList[index].paymentStatus}", style: LatoBlack.copyWith(
                                                color: Colors.white
                                            ),textAlign: TextAlign.center),
                                          )
                                      ),
                                    )
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
            )),
          ],
        ),
      ),
    );
  }
}
