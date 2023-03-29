import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrb_express/controller/auth_controller.dart';
import 'package:nrb_express/screen/merchant_panel/orders.dart';
import 'package:nrb_express/screen/rider_panel/custom_drawer.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/styles.dart';

class RiderHome extends StatefulWidget {
  const RiderHome({Key? key}) : super(key: key);

  @override
  State<RiderHome> createState() => _RiderHomeState();
}

class _RiderHomeState extends State<RiderHome> {
  AuthController authController= Get.find<AuthController>();
  @override
  void initState() {

    authController.dashBoardData();
    super.initState();
  }
  String? valueChoose;
  List listItem = [
    "1",
    "2",
    "3",
    "4",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BUTTON_BACKGROUND,
      drawer: const CustomDrwer(),
      appBar: AppBar(
        backgroundColor: ColorResources.RIDER_COLOR,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("DASHBOARD",style: LatoBold.copyWith(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 20),),
            const SizedBox(width: 10,),
            IconButton(onPressed: (){},
                icon: const Icon(Icons.search,size: 20)),
            IconButton(onPressed: (){},
                icon: const Icon(Icons.notifications_active,size: 20)),
            DropdownButton(
              icon: const Icon(Icons.more_vert,size: 20,color: Colors.white,),
              underline:const SizedBox(),
              style: const TextStyle(
                color: Colors.black, 
                fontSize: 14,
              ),
              value: valueChoose,
              onChanged: (value){
                setState(() {
                });
              },
              items: listItem.map((valueItem){
                return DropdownMenuItem(
                  value:  valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
          ],
        ),

      ),
      body: GetBuilder<AuthController>(
        builder: (auth) {
          return auth.dashboardData!=null ? ListView(
            children: [
              InkWell(
                onTap: (){
                  Get.to(()=> Orders());
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                         Image.asset("assets/images/giftbox.png",width: 60,height: 60,),
                        const SizedBox(width: 20,),
                        Container(
                          width: 0.5,
                          height: 120,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 20,),
                        Text("New Orders: ${auth.dashboardData?.newOrder}",style: LatoBold.copyWith(fontSize: 18,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(()=> Orders());
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Image.asset("assets/images/giftbox.png",width: 60,height: 60,),
                        const SizedBox(width: 20,),
                        Container(
                          width: 0.5,
                          height: 120,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 20,),
                        Text("Active Orders: ${auth.dashboardData?.active}",style: LatoBold.copyWith(fontSize: 18,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: (){
                  Get.to(()=> Orders());
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Image.asset("assets/images/giftbox.png",width: 60,height: 60,),
                        const SizedBox(width: 20,),
                        Container(
                          width: 0.5,
                          height: 120,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 20,),
                        Container(
                            child: Text("Delivered Orders: ${auth.dashboardData?.delivered}",style: LatoBold.copyWith(fontSize: 18,fontWeight: FontWeight.bold),))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ):Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}
