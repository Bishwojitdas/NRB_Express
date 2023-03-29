
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/dimensions.dart';
import 'package:nrb_express/utill/styles.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintTxt;
  final TextInputType textInputType;
  final int maxLine;
  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextInputAction textInputAction;
  final bool isPhoneNumber;
  final bool isEmail;
   Function(String?)? onSaved;
  final bool isAuth;
  final Color fillColor;

  CustomTextField(
      {required this.controller,
        required this.hintTxt,
        required this.textInputType,
        required this.maxLine,
        required this.focusNode,
        required this.nextNode,
        required this.textInputAction,
        this.isEmail = false,
        this.isPhoneNumber = false,
        required this.onSaved,
        this.isAuth = true,
        required this.fillColor});


  @override
  Widget build(context) {
    return isAuth ? TextFormField(
      style: LatoMedium.copyWith(color: ColorResources.BLACK, fontSize: Dimensions.FONT_SIZE_DEFAULT),
      controller: controller,
      maxLines: maxLine ,
      cursorColor: ColorResources.COLOR_PRIMARY,
      focusNode: focusNode,
      keyboardType: textInputType ,
      initialValue: null,
      onSaved: onSaved,
      textInputAction: textInputAction ,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(nextNode);
      },
      inputFormatters: [
        isPhoneNumber?FilteringTextInputFormatter.digitsOnly:
        FilteringTextInputFormatter.singleLineFormatter],
      validator: (input) => isEmail?input!.isValidEmail() ? null : 'Please Provide a Valid Email' : null,
      decoration: InputDecoration(
        hintText: hintTxt ,
        fillColor: ColorResources.WHITE,
        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        isDense: true,
        hintStyle: LatoBold.copyWith(color: ColorResources.HINT_TEXT_COLOR,fontSize: Dimensions.FONT_SIZE_SMALL),
        errorStyle: const TextStyle(height: 1.5),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
    )
        : Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorResources.getGreyColor(context),
        border: Border.all(color: ColorResources.COLOR_PRIMARY),
        borderRadius: isPhoneNumber ? const BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6)) : BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 3, offset: const Offset(0, 1)) // changes position of shadow
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLine ,
        cursorColor: ColorResources.COLOR_PRIMARY,
        maxLength: isPhoneNumber ? 15 : null,
        focusNode: focusNode,
        keyboardType: textInputType ,
        //keyboardType: TextInputType.number,
        initialValue: null,
        textInputAction: textInputAction ,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(nextNode);
        },
        inputFormatters: [isPhoneNumber ? FilteringTextInputFormatter.digitsOnly : FilteringTextInputFormatter.singleLineFormatter],
        validator: (input) => isEmail?input!.isValidEmail() ? null : 'Please Provide a Valid Email' : null,
        decoration: InputDecoration(
          hintText: hintTxt ,
          filled: fillColor != null,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
          isDense: true,
          counterText: '',
          // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorResources.getPrimaryColor(context))),
          hintStyle: LatoSemiBold.copyWith(color: ColorResources.getGreyColor(context)),
          errorStyle: const TextStyle(height: 1.5),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

