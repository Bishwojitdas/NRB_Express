import 'package:flutter/material.dart';
import 'package:nrb_express/screen/merchant_panel/orders.dart';
import 'package:nrb_express/screen/rider_panel/attendance.dart';
import 'package:nrb_express/screen/rider_panel/custom_navigationbar.dart';
import 'package:nrb_express/screen/rider_panel/order_deratils.dart';
import 'package:nrb_express/screen/rider_panel/accounts/rider_accounts.dart';
import 'package:nrb_express/screen/rider_panel/rider_home.dart';
import 'package:nrb_express/utill/styles.dart';


class RiderDashboard extends StatefulWidget {
  const RiderDashboard({Key? key}) : super(key: key);

  @override
  State<RiderDashboard> createState() => _RiderDashboardState();
}

class _RiderDashboardState extends State<RiderDashboard> {
  int index = 0;
  final screens = [
    const RiderHome(),
    const Orders(),
    const RiderAccounts(),
    const Attendance(),
  ];
  String NavigationColor="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.white,
            labelTextStyle: MaterialStateProperty.all(
              LatoMedium.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
            )),
        child: NavigationBar(
          backgroundColor: Colors.white,
          // animationDuration: Duration(seconds: 2),
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationBarCustom(
                icon: Icons.dashboard,
                selecIcon: Icons.dashboard,
                title: "Dashboard"),
            NavigationBarCustom(
                icon: Icons.indeterminate_check_box,
                selecIcon: Icons.indeterminate_check_box,
                title: "New Order"),
            NavigationBarCustom(
                icon: Icons.calculate,
                selecIcon: Icons.calculate,
                title: "Accounting"),
            NavigationBarCustom(
                icon: Icons.paste,
                selecIcon: Icons.paste,
                title: "Attendance"),
          ],
        ),
      ),
    );
  }
}