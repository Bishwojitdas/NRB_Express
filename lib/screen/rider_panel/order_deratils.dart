import 'package:flutter/material.dart';
import 'package:nrb_express/data/model/assign_order_model.dart';
import 'package:nrb_express/screen/rider_panel/default_view.dart';
import 'package:nrb_express/screen/rider_panel/map_view.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/styles.dart';


class OrderDetails extends StatefulWidget {
  AssignOrderData assignOrderData;
   OrderDetails({Key? key,required this.assignOrderData}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}
class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorResources.RIDER_COLOR,
          leading: IconButton(onPressed: (){},
              icon: const Icon(Icons.arrow_back)),
          title:Text("ORDER DETAILS",style: LatoBold.copyWith(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 20)),
          bottom: const TabBar(
            labelColor: Colors.white,
              tabs: [
                Tab(text: "Default View",),
                Tab(text: "Map View",)
              ]),

        ),
        body:   TabBarView(
            children: [
              DefaultView(assignOrderData: widget.assignOrderData),
              MapView(),
            ]
        ),

      ),
    );
  }
}
