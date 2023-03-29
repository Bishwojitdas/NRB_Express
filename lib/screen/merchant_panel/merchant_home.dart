import 'package:flutter/material.dart';
import 'package:nrb_express/screen/merchant_panel/custom_drawer.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/images.dart';
import 'package:nrb_express/utill/styles.dart';

class MerchantHome extends StatefulWidget {
  const MerchantHome({Key? key}) : super(key: key);

  @override
  State<MerchantHome> createState() => _MerchantHomeState();
}

class _MerchantHomeState extends State<MerchantHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      drawer: const Drawer(child: MerchantDrawer(),),
      backgroundColor: ColorResources.Home_bg,
      appBar: AppBar(
        backgroundColor: ColorResources.COLOR_PRIMARY,
        title: const Text("Merchant"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: [
          SizedBox(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: (){

              },
              child: Card(
                elevation: 5,
                color: ColorResources.Card_Home,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(Images.sales),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("BDT 12.34", style: LatoBold.copyWith(fontSize: 22, color: ColorResources.BLACK),),
                        Text("Total Cost", style: LatoBold.copyWith(fontSize: 20, color: ColorResources.getGreyColor(context)),),
                      ],
                    ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          SizedBox(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: (){

              },
              child: Card(
                elevation: 3,
                color: ColorResources.Card_Home,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(Images.money),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("BDT 12.34", style: LatoBold.copyWith(fontSize: 22, color: ColorResources.BLACK),),
                          Text("Total Shipping Cost", style: LatoBold.copyWith(fontSize: 20, color: ColorResources.getGreyColor(context)),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 5,),
          SizedBox(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: (){

              },
              child: Card(
                elevation: 3,
                color: ColorResources.Card_Home,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(Images.box),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("70", style: LatoBold.copyWith(fontSize: 22, color: ColorResources.BLACK),),
                          Text("Total Number Of Order", style: LatoBold.copyWith(fontSize: 20, color: ColorResources.getGreyColor(context)),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          SizedBox(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: (){

              },
              child: Card(
                elevation: 3,
                color: ColorResources.Card_Home,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(Images.deliverybox),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("35", style: LatoBold.copyWith(fontSize: 22, color: ColorResources.BLACK),),
                          Text("Total Number Delivery", style: LatoBold.copyWith(fontSize: 20, color: ColorResources.getGreyColor(context)),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    ));
  }
}
