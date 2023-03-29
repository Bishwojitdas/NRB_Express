import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nrb_express/controller/auth_controller.dart';
import 'package:nrb_express/screen/login_page.dart';
import 'package:nrb_express/screen/rider_panel/accounts/rider_accounts.dart';
import 'package:nrb_express/screen/rider_panel/attendance.dart';
import 'package:nrb_express/screen/rider_panel/forgot_pass/change_password.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/styles.dart';

class CustomDrwer extends StatefulWidget {
  const CustomDrwer({Key? key}) : super(key: key);

  @override
  State<CustomDrwer> createState() => _CustomDrwerState();
}

class _CustomDrwerState extends State<CustomDrwer> {
  String dashboardDrawer="";
  @override
  void initState() {
    // TODO: implement initState
    Get.find<AuthController>().getRider();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    var BUTTONBACKGROUND;
    return Drawer(
        child:  GetBuilder<AuthController>(
           builder:  (authController) => authController.riderDetailsData!=null ? ListView(
            children: [
              Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ColorResources.RIDER_DRAWER_COLOR1, ColorResources.RIDER_DRAWER_COLOR2],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        authController.riderDetailsData!.avatar,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("${authController.riderDetailsData?.firstName} ${authController.riderDetailsData?.lastName}",style: LatoBold.copyWith(fontSize: 18, color: Colors.white)),

                    Text("${authController.riderDetailsData?.email}",style: LatoBold.copyWith(fontSize: 14, color: Colors.white)
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              InkWell(
                onTap: () {
                  dashboardDrawer="Accounting";
                  setState(() {
                    Get.to(()=>RiderAccounts());
                  });
                },
                child: Container(
                  decoration:  BoxDecoration(
                    color: dashboardDrawer=="Accounting" ? ColorResources.BUTTON_BACKGROUND: Colors.white,),
                  child: ListTile(
                    leading: Icon(Icons.calculate,size: 28,color: dashboardDrawer=="Accounting" ? ColorResources.RIDER_COLOR: Colors.grey),
                    title: Text(
                      "Accounting", style: LatoBold.copyWith( fontSize: 16, color: dashboardDrawer=="Accounting" ? ColorResources.RIDER_COLOR: Colors.black ,fontWeight: FontWeight.bold),
                    ),
                  ),),
              ),

              InkWell(
                onTap: () {
                  dashboardDrawer="Profile";
                  setState(() {

                  });
                },
                child: Container(
                  decoration:  BoxDecoration(
                    color: dashboardDrawer=="Profile" ? ColorResources.BUTTON_BACKGROUND: Colors.white,),
                  child: ListTile(
                    leading: Icon(Icons.account_circle,size: 28,color: dashboardDrawer=="Profile" ? ColorResources.RIDER_COLOR: Colors.grey),
                    title: Text(
                      "Profile", style: LatoBold.copyWith( fontSize: 16, color: dashboardDrawer=="Profile" ? ColorResources.RIDER_COLOR: Colors.black , fontWeight: FontWeight.bold),
                    ),
                  ),),
              ),

              InkWell(
                onTap: () {
                  dashboardDrawer="Attendance";
                  setState(() {
                    Get.to(()=>Attendance());
                  });
                },
                child: Container(
                  decoration:  BoxDecoration(
                    color: dashboardDrawer=="Attendance" ? ColorResources.BUTTON_BACKGROUND: Colors.white,),
                  child: ListTile(
                    leading: Icon(Icons.paste,size: 28,color: dashboardDrawer=="Attendance" ? ColorResources.RIDER_COLOR: Colors.grey),
                    title: Text(
                      "Attendance", style: LatoBold.copyWith(  fontSize: 16, color: dashboardDrawer=="Attendance" ? ColorResources.RIDER_COLOR: Colors.black , fontWeight: FontWeight.bold),
                    ),
                  ),),
              ),

              InkWell(
                onTap: () {
                  dashboardDrawer="Traffic View";
                  setState(() {

                  });
                },
                child: Container(
                  decoration:  BoxDecoration(
                    color: dashboardDrawer=="Traffic View" ? ColorResources.BUTTON_BACKGROUND: Colors.white,),
                  child: ListTile(
                    leading: Icon(Icons.traffic,size: 28,color: dashboardDrawer=="Traffic View" ? ColorResources.RIDER_COLOR: Colors.grey),
                    title: Text(
                      "Traffic View", style: LatoBold.copyWith( fontSize: 16, color: dashboardDrawer=="Traffic View" ? ColorResources.RIDER_COLOR: Colors.black , fontWeight: FontWeight.bold),
                    ),
                  ),),
              ),

              InkWell(
                onTap: () {
                  dashboardDrawer="Settings";
                  setState(() {
                    Get.to(()=> ChangePassword(isMerchant: false,));
                  });
                },
                child: Container(
                  decoration:  BoxDecoration(
                    color: dashboardDrawer=="Settings" ? ColorResources.BUTTON_BACKGROUND: Colors.white,),
                  child: ListTile(
                    leading: Icon(Icons.settings,size: 28,color: dashboardDrawer=="Settings" ? ColorResources.RIDER_COLOR: Colors.grey),
                    title: Text(
                      "Settings", style: LatoBold.copyWith( fontSize: 16, color: dashboardDrawer=="Settings" ? ColorResources.RIDER_COLOR: Colors.black , fontWeight: FontWeight.bold),
                    ),
                  ),),
              ),

              InkWell(
                onTap: () {
                  dashboardDrawer="Change Password";
                  setState(() {
                    Get.to(()=> ChangePassword(isMerchant: false));
                  });
                },
                child: Container(
                  decoration:  BoxDecoration(
                    color: dashboardDrawer=="Change Password" ? ColorResources.BUTTON_BACKGROUND: Colors.white,),
                  child: ListTile(
                    leading: Icon(Icons.password,size: 28,color: dashboardDrawer=="Change Password" ? ColorResources.RIDER_COLOR: Colors.grey),
                    title: Text(
                      "Change Password", style: LatoBold.copyWith( fontSize: 16, color: dashboardDrawer=="Change Password" ? ColorResources.RIDER_COLOR: Colors.black , fontWeight: FontWeight.bold),
                    ),
                  ),),
              ),

              InkWell(
                onTap: () {
                  dashboardDrawer="Log Out";
                  setState(() {
                    authController.logOut().then((value) {
                      if(value.isSuccess){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginPage(isMerchant: false,)), (route) => true);
                        EasyLoading.showSuccess("${value.message}");
                      }else{
                        EasyLoading.showSuccess("${value.message}");
                      }
                    });
                  });
                },
                child: Container(
                  decoration:  BoxDecoration(
                    color: dashboardDrawer=="Log Out" ? ColorResources.BUTTON_BACKGROUND: Colors.white,),
                  child: ListTile(
                    leading: Icon(Icons.logout,size: 28,color: dashboardDrawer=="Log Out" ? ColorResources.RIDER_COLOR: Colors.grey),
                    title: Text(
                      "Log Out", style: LatoBold.copyWith( fontSize: 16, color: dashboardDrawer=="Log Out" ? ColorResources.RIDER_COLOR: Colors.black , fontWeight: FontWeight.bold),
                    ),
                  ),),
              ),


            ],
          ):const Center(child: CircularProgressIndicator()),
        ));
  }
}
