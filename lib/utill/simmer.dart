import 'package:flutter/material.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/images.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'dimensions.dart';

class NoDataShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Shimmer(
          color: ColorResources.GREY,
          duration: const Duration(seconds: 1),
          /*enabled: Provider
              .of<ClientProvider>(context)
              .clientList == null,*/
          child: Container(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, spreadRadius: 1, blurRadius: 5)
              ],
              color: ColorResources.TEXT_FIELD_BG,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                        height: 22,
                        width: 22,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration:
                        BoxDecoration(
                            color: ColorResources.getGreyColor(context),
                            shape: BoxShape.circle)
                    ),
                    const SizedBox(height: 5,),
                    Container(
                        height: 22,
                        width: 22,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration:
                        BoxDecoration(
                            color: ColorResources.getGreyColor(context),
                            shape: BoxShape.circle)
                    ),
                    const SizedBox(height: 5,),
                    Container(
                        height: 22,
                        width: 22,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration:
                        BoxDecoration(
                            color: ColorResources.getGreyColor(context),
                            shape: BoxShape.circle)
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: ColorResources.getGreyColor(context),
                      height: 10,
                      width: 200,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: ColorResources.getGreyColor(context),
                      height: 10,
                      width: 110,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: ColorResources.getGreyColor(context),
                      height: 10,
                      width: 90,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class NoDataScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      child: Center(
        child: Align(
          alignment: Alignment.center,
          child: ListView( children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                Images.no_cloud_data,
                height: 250,
                width: 250,
                // width: MediaQuery.of(context).size.height*1, height: MediaQuery.of(context).size.height*.5,
              ),
            ),

            Text(
              'No Data Found',
              style: TextStyle(color: ColorResources.BLACK, fontSize: MediaQuery.of(context).size.height*0.023),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }
}