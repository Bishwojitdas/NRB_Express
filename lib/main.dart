import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nrb_express/controller/auth_controller.dart';
import 'package:nrb_express/helper/di_init.dart' as di;
import 'package:nrb_express/screen/merchant_panel/merchant_dashboard.dart';
import 'package:nrb_express/screen/merchant_panel/pre_login.dart';
import 'package:nrb_express/screen/rider_panel/rider_bd.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/styles.dart';
import 'utill/images.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NRB Express',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: ColorResources.WHITE,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: ColorResources.BLACK,
        scaffoldBackgroundColor: ColorResources.WHITE,
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(seconds: 1),
      home: const SplashScreen(title: 'NRB Express'),
      builder:EasyLoading.init(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});

  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then((value) => {
      if(value!=null){
        print("Notification_type: ${value.notification!.title.toString()}"),
        Navigator.of(context).pushNamed(value.data["notificationType"])
        //Notification
      }else{
        _route()
      }
    });
  }
  void _route() {
    Timer(const Duration(seconds: 1), () async {
       AuthController authController=Get.find<AuthController>();
       authController.setIsMerchant(false);
       print("Is Login: ${authController.getIsLogin()}");
       Get.to(()=>const PreLogin());
       if(authController.getIsLogin()){
         authController.getIsMerchant() ? Get.to(()=>const MerchantDashboard()) :
          Get.to(()=>const RiderDashboard());
       }else{
         Get.to(()=>const PreLogin());
       }
    });
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration:const BoxDecoration(
          color: ColorResources.COLOR_PRIMARY
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: Image.asset(Images.logo_nrb),),
          const SizedBox(height: 20,),
          Text("NRB Express", style: LatoBold.copyWith(fontSize: 22, color: ColorResources.WHITE),)
        ],
      ),
    );
  }
}
