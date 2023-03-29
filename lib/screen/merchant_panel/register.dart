import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrb_express/controller/register_controller.dart';
import 'package:nrb_express/screen/rider_panel/rider_bd.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/dimensions.dart';
import 'package:nrb_express/utill/styles.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterController registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: ColorResources.COLOR_PRIMARY,
        elevation: 0.0,
        title: Text(
          "REGISTER",
          style: LatoRegular.copyWith(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Region:",
                        style: LatoMedium.copyWith(
                            fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                            color: Colors.grey[700]),
                      ),
                      Row(
                        children: [
                          Radio(
                            value: "Local",
                            groupValue: registerController.region,
                            activeColor: ColorResources.COLOR_PRIMARY,
                            onChanged: (String? variable) {
                              setState(() {
                                registerController.region = variable!;
                              });
                            },
                          ),
                          Text(
                            "Local",
                            style: LatoRegular.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: "International",
                            groupValue: registerController.region,
                            activeColor: ColorResources.COLOR_PRIMARY,
                            onChanged: (String? variable) {
                              setState(() {
                                registerController.region = variable!;
                              });
                            },
                          ),
                          Text(
                            "International",
                            style: LatoRegular.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Account Type:",
                          style: LatoMedium.copyWith(
                              fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                              color: Colors.grey[700]),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: "Retail",
                                groupValue: registerController.accountType,
                                activeColor: ColorResources.COLOR_PRIMARY,
                                onChanged: (String? variable) {
                                  setState(() {
                                    registerController.accountType = variable!;
                                  });
                                },
                              ),
                              Text(
                                "Retail",
                                style: LatoRegular.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "Corporate",
                                groupValue: registerController.accountType,
                                activeColor: ColorResources.COLOR_PRIMARY,
                                onChanged: (String? variable) {
                                  setState(() {
                                    registerController.accountType = variable!;
                                  });
                                },
                              ),
                              Text(
                                "Corporate",
                                style: LatoRegular.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "Government",
                                groupValue: registerController.accountType,
                                activeColor: ColorResources.COLOR_PRIMARY,
                                onChanged: (String? variable) {
                                  setState(() {
                                    registerController.accountType = variable!;
                                  });
                                },
                              ),
                              Text(
                                "Government",
                                style: LatoRegular.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Form(
                      child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: ColorResources.HINT_TEXT_COLOR))),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.person,
                                size: 25,
                                color: ColorResources.COLOR_PRIMARY,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 2,
                              color: ColorResources.HINT_TEXT_COLOR,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: registerController.nameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    hintText: "Full Name",
                                    hintStyle: LatoRegular.copyWith(
                                        fontSize: 16, color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: ColorResources.HINT_TEXT_COLOR))),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.email,
                                size: 25,
                                color: ColorResources.COLOR_PRIMARY,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 2,
                              color: ColorResources.HINT_TEXT_COLOR,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller:
                                      registerController.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: LatoRegular.copyWith(
                                        fontSize: 16, color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: ColorResources.HINT_TEXT_COLOR))),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.phone,
                                size: 25,
                                color: ColorResources.COLOR_PRIMARY,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 2,
                              color: ColorResources.HINT_TEXT_COLOR,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller:
                                      registerController.phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    hintText: "Phone",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: ColorResources.HINT_TEXT_COLOR))),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.lock,
                                size: 25,
                                color: ColorResources.COLOR_PRIMARY,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 2,
                              color: ColorResources.HINT_TEXT_COLOR,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: registerController.passController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    hintText: "Password",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: ColorResources.HINT_TEXT_COLOR))),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.lock,
                                size: 25,
                                color: ColorResources.COLOR_PRIMARY,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 2,
                              color: ColorResources.HINT_TEXT_COLOR,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller:
                                      registerController.confirmController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    hintText: "Confirm Password",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Privacy and Policy",
                                style: LatoRegular.copyWith(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(const RiderDashboard());
                              String name =
                                  registerController.nameController.text ?? "";
                              String email =
                                  registerController.emailController.text ?? "";
                              String phone =
                                  registerController.phoneController.text ?? "";
                              String region = registerController.region ?? "";
                              String account =
                                  registerController.accountType ?? "";
                              registerController.nameItem(name);
                              registerController.emailItem(email);
                              registerController.phoneItem(phone);
                              registerController.regionItem(region);
                              registerController.accountItem(account);
                            },
                            child: Container(
                              height: 45,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: ColorResources.COLOR_PRIMARY,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                "REGISTER NOW!",
                                style: LatoBold.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                    overflow: TextOverflow.fade),
                              )),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Already Registered?",
                            style: LatoRegular.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Login Here",
                                style: LatoRegular.copyWith(
                                    fontSize: 18,
                                    color: ColorResources.COLOR_PRIMARY,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
