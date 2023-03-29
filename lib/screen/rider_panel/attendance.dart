import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrb_express/controller/attendance_controller.dart';
import 'package:nrb_express/screen/merchant_panel/orders.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/styles.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  AttendanceController attendanceController=Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        appBar: AppBar(
          backgroundColor: ColorResources.COLOR_PRIMARY_RIDER,
          title: Text("Attendance"),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: SizedBox(
                    height: 35,
                    width: FullWidth(context)/3,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "From",
                          suffixIcon: const Icon(Icons.perm_contact_calendar_rounded),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: SizedBox(
                    height: 35,
                    width: FullWidth(context)/3,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "To",
                          suffixIcon: const Icon(Icons.perm_contact_calendar_rounded),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorResources.COLOR_PRIMARY_RIDER
                      ),
                      child: IconButton(onPressed: () {

                      },
                          icon: const Icon(Icons.search, color: Colors.white,size: 25,))
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 30,
                width: Get.width,
                decoration: const BoxDecoration(
                    color: Colors.grey
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Date", style: LatoBlack.copyWith(fontSize: 16),),
                      Text("Check In", style: LatoBlack.copyWith(fontSize: 16),),
                      Text("Check Out", style: LatoBlack.copyWith(fontSize: 16),)
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10,),

            Obx(() => SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.55,
              child: ListView.builder(
                itemCount: attendanceController.attendanceList!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: Get.width/4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: ColorResources.COLOR_PRIMARY_RIDER
                                    ),
                                      child:  Text("${attendanceController.attendanceList![index].date}",style: LatoBlack.copyWith(color: ColorResources.WHITE)),
                                      padding: EdgeInsets.all(8),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Get.width/3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2),
                                      child: Text("${attendanceController.attendanceList![index].checkInTime}",style: LatoRegular),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2),
                                      child: Text("${attendanceController.attendanceList![index].checkInAddress}",style: LatoRegular),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Get.width/3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2),
                                      child: Text("${attendanceController.attendanceList![index].checkOutTime}",style: LatoRegular),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2),
                                      child: Text("${attendanceController.attendanceList![index].checkInAddress}",style: LatoRegular),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
