
import 'package:flutter/material.dart';
import 'package:nrb_express/base/navigationBarCustom.dart';
import 'package:nrb_express/screen/merchant_panel/billing.dart';
import 'package:nrb_express/screen/merchant_panel/merchant_home.dart';
import 'package:nrb_express/screen/merchant_panel/edit_profile.dart';
import 'package:nrb_express/utill/styles.dart';

import 'orders.dart';

class MerchantDashboard extends StatefulWidget {
  const MerchantDashboard({Key? key}) : super(key: key);

  @override
  State<MerchantDashboard> createState() => _MerchantDashboardState();
}

class _MerchantDashboardState extends State<MerchantDashboard> {
  int index = 0;
  final screens = [
    const MerchantHome(),
    const Orders(),
    const Billing(),
    const EditProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade200,
            labelTextStyle: MaterialStateProperty.all(
              LatoRegular.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
            )),
        child: NavigationBar(
          backgroundColor: const Color(0xFFf1f5fb),
          // animationDuration: Duration(seconds: 2),
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationBarCustom(
                icon: Icons.dashboard_outlined,
                selecIcon: Icons.dashboard,
                title: "Dashboard"),
            NavigationBarCustom(
                icon: Icons.my_library_books,
                selecIcon: Icons.library_books_outlined,
                title: "Orders"),
            NavigationBarCustom(
                icon: Icons.edit_calendar,
                selecIcon: Icons.edit_calendar_outlined,
                title: "Billing"),
            NavigationBarCustom(
                icon: Icons.person_outline,
                selecIcon: Icons.person,
                title: "Profile"),
          ],
        ),
      ),
    );
  }
}