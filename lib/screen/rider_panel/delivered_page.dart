import 'package:flutter/material.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/styles.dart';

class DeliveredPage extends StatefulWidget {
  const DeliveredPage({Key? key}) : super(key: key);

  @override
  State<DeliveredPage> createState() => _DeliveredPageState();
}

class _DeliveredPageState extends State<DeliveredPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.RIDER_COLOR,
        leading: IconButton(onPressed: (){},
            icon: const Icon(Icons.arrow_back)),
        title:Text("DELIVERED",style: LatoBold.copyWith(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 20)),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                color:  ColorResources.SIGNATURE_BACKGROUND,
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Write your remarks",style: LatoBold.copyWith(fontWeight: FontWeight.w600,color:  Colors.grey,fontSize: 20)),
              ),
              const SizedBox(height: 100,),
              Container(
                color: ColorResources.SIGNATURE_BACKGROUND,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width/2.11,
                          decoration: const BoxDecoration(
                            color:  ColorResources.SIGNATURE_BACKGROUND,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15.0, // soften the shadow
                                spreadRadius: 2.0, //extend the shadow
                                offset: Offset(
                                  2.0, // Move to right 5  horizontally
                                  2.0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("CLEAR PAD",style: LatoBold.copyWith(fontWeight: FontWeight.w600,color:  Colors.black,fontSize: 16)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width/2.11,
                          decoration: const BoxDecoration(
                            color:  ColorResources.SIGNATURE_BACKGROUND,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15.0, // soften the shadow
                                spreadRadius: 2.0, //extend the shadow
                                offset: Offset(
                                  2.0, // Move to right 5  horizontally
                                  2.0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("SEND",style: LatoBold.copyWith(fontWeight: FontWeight.w600,color:  Colors.black,fontSize: 16)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
