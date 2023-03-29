import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrb_express/controller/auth_controller.dart';
import 'package:nrb_express/controller/pre_login_controller.dart';
import 'package:nrb_express/screen/login_page.dart';
import 'package:nrb_express/screen/merchant_panel/p_list.dart';
import 'package:nrb_express/screen/merchant_panel/register.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/images.dart';
import 'package:nrb_express/utill/styles.dart';


class PreLogin extends StatefulWidget {
  const PreLogin({Key? key}) : super(key: key);

  @override
  State<PreLogin> createState() => _PreLoginState();
}

class _PreLoginState extends State<PreLogin> {
  GlobalKey formKey = GlobalKey<FormState>();
  PreLoginController homeController = PreLoginController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.BACKGROUND_COLOR,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  Images.delivery,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets
                .only(
                  left: 10,
                  right: 10,
                ),
                height: MediaQuery.of(context).size.height / 1.1,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconText(
                        icon: Icons.settings,
                        title:
                            "Lightning fast Courier Service "),
                    IconText(
                        icon: Icons.light_mode_outlined,
                        title:
                            "Lightning fast Courier Service Get your parcel delivered anywhere you want"),
                    IconText(
                        icon: Icons.offline_bolt_outlined,
                        title:
                            "Lightning fast Courier Service Get your parcel delivered anywhere you want"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(const Register());
                          },
                          child: Container(
                            height: 45,
                            width: 140,
                            decoration: BoxDecoration(
                                color: ColorResources.COLOR_PRIMARY,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                              "GET STARTED",
                              style: LatoBold.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white,
                                  overflow: TextOverflow.fade),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(()=> LoginPage(isMerchant: false,));
                          },
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                              "LOGIN",
                              style: LatoRegular.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorResources.COLOR_PRIMARY,
                                  overflow: TextOverflow.fade),
                            )),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.6,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Track Your Order",
                                style: LatoRegular.copyWith(
                                    fontSize: 26,
                                    color: ColorResources.COLOR_PRIMARY,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Form(
                                key: formKey,
                                child: TextFormField(
                                  controller: homeController.phoneController,
                                  decoration: InputDecoration(
                                    hintText: "  Tracking Number",
                                    hintStyle: LatoRegular.copyWith(
                                        fontSize: 23, color: Colors.grey),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(const PList());
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1, color: Colors.grey)),
                                      child: Center(
                                          child: Text(
                                        "TRACK NOW",
                                        style: LatoRegular.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: ColorResources.COLOR_PRIMARY,
                                            overflow: TextOverflow.fade),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      String item =
                                          homeController.phoneController.text ??
                                              "";
                                      homeController.phoneitem(item);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: ColorResources.COLOR_PRIMARY,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "QUICK QUOTE",
                                        style: LatoBold.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                            overflow: TextOverflow.fade),
                                        )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
