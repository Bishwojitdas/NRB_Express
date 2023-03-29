import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrb_express/screen/rider_panel/forgot_pass/change_password.dart';
import 'package:nrb_express/utill/color_resources.dart';

class ForgotPassword extends StatefulWidget {
  bool isMerchant=false;
   ForgotPassword({Key? key, required this.isMerchant}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: Get.width,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1,color: ColorResources.HINT_TEXT_COLOR)
                  )
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    child:  Icon(Icons.markunread_outlined,size: 30,color: widget.isMerchant ? ColorResources.COLOR_PRIMARY: ColorResources.COLOR_PRIMARY_RIDER ,),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 2,
                    color:ColorResources.HINT_TEXT_COLOR,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "  Email",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Get.to(()=> ChangePassword(isMerchant: false,));
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: Get.width-20,
                decoration: BoxDecoration(
                  color: widget.isMerchant ? ColorResources.COLOR_PRIMARY: ColorResources.COLOR_PRIMARY_RIDER ,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "Send VerificationLink",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
