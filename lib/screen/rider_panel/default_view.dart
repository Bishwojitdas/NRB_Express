import 'package:flutter/material.dart';
import 'package:nrb_express/data/model/assign_order_model.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/styles.dart';


class DefaultView extends StatefulWidget {
  AssignOrderData assignOrderData;
   DefaultView({Key? key, required this.assignOrderData}) : super(key: key);

  @override
  State<DefaultView> createState() => _DefaultViewState();
}

class _DefaultViewState extends State<DefaultView> {
  String? valueChoose;
  List listItem = [
    "Picked Up",
    "DroppedOff",
    "Transferred",
    "On Hold",
    "Delivered",
    "Went for delivery",
    "Returned",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BUTTON_BACKGROUND,
      body: ListView(
        children: [
          Column(
            children: [

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order status:",style: LatoBold.copyWith(fontSize: 16)),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width/1.9,
                        alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius:const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15,left: 15),
                            child: Text(widget.assignOrderData.status,style: LatoBold.copyWith(fontSize: 18))
                            /*DropdownButton(
                              hint: const Text("Select"),
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 30,
                              isExpanded: true,
                              underline:const SizedBox(),
                              style: LatoBold.copyWith(fontSize: 16,color: Colors.black),
                              value: valueChoose,
                              onChanged: (value){
                                setState(() {
                                  valueChoose = value as String?;
                                });
                              },
                              items: listItem.map((valueItem){
                                return DropdownMenuItem(
                                  value:  valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),*/
                          )
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10,),

              Text("SENDER INFORMATION",style: LatoBold.copyWith(fontSize: 20,fontWeight: FontWeight.bold,color: ColorResources.RIDER_COLOR)),

              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.assignOrderData.sender,style: LatoBold.copyWith(fontSize: 14)),
                        const SizedBox(height: 5,),
                        Text(widget.assignOrderData.senderAddress,style: LatoBold.copyWith(fontSize: 14)),
                        const SizedBox(height: 10,),
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: ColorResources.RIDER_COLOR,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ClipRRect(
                                    child: Image.asset("assets/images/telephone.png",width: 35,height: 35,),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text(widget.assignOrderData.recieverPhone,style: LatoBold.copyWith(fontSize: 16,color: Colors.white),)                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10,),

              Text("RECEIVER INFORMATION",style: LatoBold.copyWith(fontSize: 20,fontWeight: FontWeight.bold,color: ColorResources.RIDER_COLOR)),

              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.assignOrderData.recieverName,style: LatoBold.copyWith(fontSize: 14)),
                        const SizedBox(height: 5,),
                        Text(widget.assignOrderData.receiverAddress,style: LatoBold.copyWith(fontSize: 14)),
                        const SizedBox(height: 10,),
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                              color: ColorResources.RIDER_COLOR,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ClipRRect(
                                    child: Image.asset("assets/images/telephone.png",width: 35,height: 35,),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text(widget.assignOrderData.recieverPhone,style: LatoBold.copyWith(fontSize: 16,color: Colors.white),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10,),

              Text("ORDER DETAILS",style: LatoBold.copyWith(fontSize: 20,fontWeight: FontWeight.bold,color: ColorResources.RIDER_COLOR)),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order#${widget.assignOrderData.id}",style: LatoBold.copyWith(fontSize: 14)),
                        const SizedBox(height: 10,),
                        Text(widget.assignOrderData.date,style: LatoBold.copyWith(fontSize: 14)),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Parcel Type: ${widget.assignOrderData.shipmentItemType}",style: LatoBold.copyWith(fontSize: 14)),
                            Text("Amount: ${widget.assignOrderData.amount} TK",style: LatoBold.copyWith(fontSize: 14)),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Text("Payment Method: ${widget.assignOrderData.paymentMethod}",style: LatoBold.copyWith(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              ),




            ],
          )
        ],
      ),
    );
  }
}
