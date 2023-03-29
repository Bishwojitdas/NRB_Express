
import 'package:flutter/cupertino.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/images.dart';

Container roundedLogo(double weight, double height, double padding, double borderWeight) {
  return Container(
      height: height,
      width: weight,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: ColorResources.WHITE,
          shape: BoxShape.circle,
          border: Border.all(
            width: borderWeight,
            color: ColorResources.Border_color,
          )
      ),
      child: Image.asset(Images.logo_nrb,  ),
    );
}