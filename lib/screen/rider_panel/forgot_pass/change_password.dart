import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nrb_express/controller/auth_controller.dart';
import 'package:nrb_express/screen/merchant_panel/merchant_dashboard.dart';
import 'package:nrb_express/screen/rider_panel/rider_bd.dart';
import 'package:nrb_express/utill/color_resources.dart';

class ChangePassword extends StatefulWidget {
  bool isMerchant;
  ChangePassword({Key? key, required this.isMerchant}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

bool isCheck = false;
String savePassword = "";
String saveemail = "";


final passwordController = TextEditingController();
final newPasswordController = TextEditingController();
final confirmPasswordController = TextEditingController();


class _ChangePasswordState extends State<ChangePassword> {
  var passIsSecure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorResources.TEXT_BG,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: ColorResources.WHITE,
            )),
        title: const Text(
          "Change Password",
          style: TextStyle(
            fontSize: 25,
            color: ColorResources.WHITE,
          ),
        ),
        backgroundColor: widget.isMerchant
            ? ColorResources.COLOR_PRIMARY
            : ColorResources.COLOR_PRIMARY_RIDER,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          SizedBox(
            height: Get.height / 5,
          ),
          Container(
            height: 50,
            width: Get.width,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: ColorResources.HINT_TEXT_COLOR))),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  child: InkWell(
                      onTap: () {
                        passIsSecure = !passIsSecure;
                        setState(() {});
                      },
                      child: Icon(Icons.lock_outlined,
                          size: 30,
                          color: widget.isMerchant
                              ? ColorResources.COLOR_PRIMARY
                              : ColorResources.COLOR_PRIMARY_RIDER)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 2,
                  color: ColorResources.HINT_TEXT_COLOR,
                ),
                Expanded(
                  child: TextField(
                    obscureText: passIsSecure,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: " Old Password",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: Get.width,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: ColorResources.HINT_TEXT_COLOR))),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  child: InkWell(
                      onTap: () {
                        passIsSecure = !passIsSecure;
                        setState(() {});
                      },
                      child: Icon(Icons.lock_outlined,
                          size: 30,
                          color: widget.isMerchant
                              ? ColorResources.COLOR_PRIMARY
                              : ColorResources.COLOR_PRIMARY_RIDER)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 2,
                  color: ColorResources.HINT_TEXT_COLOR,
                ),
                Expanded(
                  child: TextField(
                    obscureText: passIsSecure,
                    controller: newPasswordController,
                    decoration: const InputDecoration(
                      hintText: "  New Password",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: Get.width,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: ColorResources.HINT_TEXT_COLOR))),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  child: InkWell(
                      onTap: () {
                        passIsSecure = !passIsSecure;
                        setState(() {});
                      },
                      child: Icon(Icons.lock_outlined,
                          size: 30,
                          color: widget.isMerchant
                              ? ColorResources.COLOR_PRIMARY
                              : ColorResources.COLOR_PRIMARY_RIDER)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 2,
                  color: ColorResources.HINT_TEXT_COLOR,
                ),
                Expanded(
                  child: TextField(
                    obscureText: passIsSecure,
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      hintText: "  Confirm Password",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              AuthController auth=Get.find<AuthController>();
              String oldPass=passwordController.text.trim();
              String newPass=newPasswordController.text.trim();
              String confirmPass=confirmPasswordController.text.trim();
              auth.changePass(oldPass, newPass, confirmPass).then((value) => {
                if(value.isSuccess){
                  EasyLoading.showSuccess("${value.message}"),
              widget.isMerchant
                  ? Get.to(() => const MerchantDashboard())
                  : Get.to(() => const RiderDashboard())
                }else{
                  EasyLoading.showSuccess("${value.message}")
                }
              });
              setState(() {
                passwordController.clear();
                newPasswordController.clear();
                confirmPasswordController.clear();
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: Get.width - 20,
                  decoration: BoxDecoration(
                    color: widget.isMerchant
                        ? ColorResources.COLOR_PRIMARY
                        : ColorResources.COLOR_PRIMARY_RIDER,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Change Password",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
