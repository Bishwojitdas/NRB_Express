
import 'package:flutter/material.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/dimensions.dart';
import 'package:nrb_express/utill/images.dart';
import 'package:nrb_express/utill/styles.dart';
class NoDataScreen extends StatelessWidget {
String message;

NoDataScreen({this.message="Nothing Found"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      child: Center(
        child: Align(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch, children: [

            Image.asset(
             Images.no_data,
              width: MediaQuery.of(context).size.height*.8, height: MediaQuery.of(context).size.height*.2,
            ),
            Text(
              message,
              style: LatoBold.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: MediaQuery.of(context).size.height*0.023),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }
}
