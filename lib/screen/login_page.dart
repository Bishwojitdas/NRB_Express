import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nrb_express/controller/auth_controller.dart';
import 'package:nrb_express/screen/merchant_panel/merchant_dashboard.dart';
import 'package:nrb_express/screen/merchant_panel/register.dart';
import 'package:nrb_express/screen/rider_panel/forgot_pass/forgot_password.dart';
import 'package:nrb_express/screen/rider_panel/rider_bd.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/helper/di_init.dart' as di;

class LoginPage extends StatefulWidget {
  bool isMerchant;
   LoginPage({Key? key, required this.isMerchant}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

bool isCheck = false;
String savePassword = "";
String saveemail = "";



class _LoginPageState extends State<LoginPage> {
  var passIsSecure=true;

  AuthController authController=Get.find<AuthController>();

 late TextEditingController passwordController ;
  late TextEditingController emailController ;
  String userEmail="" ;
  String userPassword="" ;
  @override
  void initState() {
    // TODO: implement initState
     passwordController = TextEditingController();
     emailController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorResources.TEXT_BG,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          
        },
            icon: const Icon(Icons.arrow_back ,size: 30, color: ColorResources.WHITE,)),
        title: const Text("LOGIN",style: TextStyle(fontSize: 25,color:  ColorResources.WHITE,) ,),
        backgroundColor:widget.isMerchant ? ColorResources.COLOR_PRIMARY: ColorResources.COLOR_PRIMARY_RIDER ,
      ),
          body: ListView(
            padding: const EdgeInsets.all(10),
                  children: [
                    SizedBox(height: Get.height/5,),
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
                          Expanded(
                           child: Padding(
                             padding: const EdgeInsets.only(left: 10),
                             child: TextField(
                               style: TextStyle(color: ColorResources.BLACK),
                               controller: emailController,
                               decoration:const InputDecoration(
                                 hintText: "  Email",
                                 border: InputBorder.none,
                               ),
                               ),
                           ),
                         ),
                       ],
                     ),
                   ),
                    const SizedBox(height: 20,),
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
                            child: InkWell(
                              onTap: (){
                                passIsSecure=!passIsSecure;
                                setState(() {
                                });
                              },
                                child:  Icon(Icons.lock_outlined,size: 30,color: widget.isMerchant ? ColorResources.COLOR_PRIMARY: ColorResources.COLOR_PRIMARY_RIDER )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 2,
                            color: ColorResources.HINT_TEXT_COLOR,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextField(
                                style: TextStyle(color: ColorResources.BLACK),
                                controller: passwordController,
                                obscureText: passIsSecure,
                                decoration: const InputDecoration(
                                  hintText: "  Password",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Checkbox(
                                side: BorderSide(color: Colors.black),
                                checkColor: Colors.green,
                                  activeColor: Colors.black12,
                                  value: isCheck,
                                  onChanged: (value) {
                                    setState(() {
                                      isCheck = value!;
                                      savePassword = value ? passwordController.text:
                                      "Password Empty";
                                      saveemail = value? emailController.text:
                                      "Email Empty";
                                    });
                                  }
                              ),
                              const Text("Remember me",style: TextStyle(fontSize: 16, color: ColorResources.BLACK),),
                            ],
                          ),
                        ),
                        TextButton(onPressed: (){
                          Get.to(()=>ForgotPassword(isMerchant: false,));
                        }, child: const Text("Forgot Your Password",
                          style: TextStyle(color: ColorResources.BLACK, decoration: TextDecoration.underline,fontSize: 16),))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () async{
                        EasyLoading.show(status: "Login...");
                        setState(() {
                          userEmail = emailController.text;
                          userPassword = passwordController.text;
                          if(userEmail==""){
                            EasyLoading.showError("Enter Email");
                            return ;
                          }

                          if(userPassword==""){
                            EasyLoading.showError("Enter Password");
                            return ;
                          }
                          authController.login(userEmail, userPassword).then((value)  {
                            if(value.isSuccess){
                              authController.setIsLogin(true);
                              authController.setIsMerchant(false);
                               di.init();
                              widget.isMerchant ?  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MerchantDashboard()), (route) => false)
                                  : Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> RiderDashboard()), (route) => false);
                              EasyLoading.showSuccess("Login Success");
                              EasyLoading.dismiss();
                            }else{
                              EasyLoading.showError("Login Failed");
                              EasyLoading.dismiss();
                            }
                          });
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: Get.width/2.5,
                              decoration: BoxDecoration(
                                color: widget.isMerchant ? ColorResources.COLOR_PRIMARY: ColorResources.COLOR_PRIMARY_RIDER ,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "LOGIN NOW!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 50,),
                    // Text('Email: $saveemail'),
                    // Text('Password: $savePassword'),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("New User?",style: TextStyle(fontSize: 18),),
                        TextButton(onPressed: (){

                        },
                          child: InkWell(
                            onTap: (){
                              Get.to(const Register());
                            },
                            child: const Text("Sing Up Here",
                              style: TextStyle(fontSize: 18,color: ColorResources.BLACK,
                                  decoration: TextDecoration.underline),),
                          ),)
                      ],
                    )
            ],
          ),
    ),
    );
  }
}
