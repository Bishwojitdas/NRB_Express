import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrb_express/utill/color_resources.dart';

class MerchantDrawer extends StatefulWidget {
  const MerchantDrawer({Key? key}) : super(key: key);

  @override
  State<MerchantDrawer> createState() => _MerchantDrawerState();
}

class _MerchantDrawerState extends State<MerchantDrawer> {
  String dashboardDrawer = "";

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        Container(
          height: 230,
          width: MediaQuery.of(context).size.width,
          color: ColorResources.COLOR_PRIMARY,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  "https://everydaypower.com/wp-content/uploads/2020/04/50-Classy-Gentleman-Quotes-to-Help-You-Earn-Respect-1000x600.jpg",
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Hazi Textile",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const Text(
                "hazi@mailnator.com",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            dashboardDrawer = "Dashboard";
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: dashboardDrawer == "Dashboard"
                  ? ColorResources.BACKGROUND_COLOR
                  : Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.dashboard,
                  size: 28,
                  color: dashboardDrawer == "Dashboard"
                      ? ColorResources.COLOR_PRIMARY
                      : Colors.grey),
              title: Text(
                "Dashboard",
                style: TextStyle(
                    fontSize: 16,
                    color: dashboardDrawer == "Dashboard"
                        ? ColorResources.COLOR_PRIMARY
                        : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          width: Get.width,
          color: ColorResources.BACKGROUND_COLOR,
        ),
        InkWell(
          onTap: () {
            dashboardDrawer = "Your Profile";
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: dashboardDrawer == "Your Profile"
                  ? ColorResources.BACKGROUND_COLOR
                  : Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.account_circle,
                  size: 28,
                  color: dashboardDrawer == "Your Profile"
                      ? ColorResources.COLOR_PRIMARY
                      : Colors.grey),
              title: Text(
                "Your Profile",
                style: TextStyle(
                    fontSize: 16,
                    color: dashboardDrawer == "Your Profile"
                        ? ColorResources.COLOR_PRIMARY
                        : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          width: Get.width,
          color: ColorResources.BACKGROUND_COLOR,
        ),
        InkWell(
          onTap: () {
            dashboardDrawer = "Orders";
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: dashboardDrawer == "Orders"
                  ? ColorResources.BACKGROUND_COLOR
                  : Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.account_tree,
                  size: 28,
                  color: dashboardDrawer == "Orders"
                      ? ColorResources.COLOR_PRIMARY
                      : Colors.grey),
              title: Text(
                "Orders",
                style: TextStyle(
                    fontSize: 16,
                    color: dashboardDrawer == "Orders"
                        ? ColorResources.COLOR_PRIMARY
                        : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          width: Get.width,
          color: ColorResources.BACKGROUND_COLOR,
        ),
        InkWell(
          onTap: () {
            dashboardDrawer = "Billing";
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: dashboardDrawer == "Billing"
                  ? ColorResources.BACKGROUND_COLOR
                  : Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.post_add,
                  size: 28,
                  color: dashboardDrawer == "Billing"
                      ? ColorResources.COLOR_PRIMARY
                      : Colors.grey),
              title: Text(
                "Billing",
                style: TextStyle(
                    fontSize: 16,
                    color: dashboardDrawer == "Billing"
                        ? ColorResources.COLOR_PRIMARY
                        : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          width: Get.width,
          color: ColorResources.BACKGROUND_COLOR,
        ),
        InkWell(
          onTap: () {
            dashboardDrawer = "Rate Calculator";
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: dashboardDrawer == "Rate Calculator"
                  ? ColorResources.BACKGROUND_COLOR
                  : Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.calculate,
                  size: 28,
                  color: dashboardDrawer == "Rate Calculator"
                      ? ColorResources.COLOR_PRIMARY
                      : Colors.grey),
              title: Text(
                "Rate Calculator",
                style: TextStyle(
                    fontSize: 16,
                    color: dashboardDrawer == "Rate Calculator"
                        ? ColorResources.COLOR_PRIMARY
                        : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          width: Get.width,
          color: ColorResources.BACKGROUND_COLOR,
        ),
        InkWell(
          onTap: () {
            dashboardDrawer = "Claim/Dispute";
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: dashboardDrawer == "Claim/Dispute"
                  ? ColorResources.BACKGROUND_COLOR
                  : Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.class_outlined,
                  size: 28,
                  color: dashboardDrawer == "Claim/Dispute"
                      ? ColorResources.COLOR_PRIMARY
                      : Colors.grey),
              title: Text(
                "Claim/Dispute",
                style: TextStyle(
                    fontSize: 16,
                    color: dashboardDrawer == "Claim/Dispute"
                        ? ColorResources.COLOR_PRIMARY
                        : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          width: Get.width,
          color: ColorResources.BACKGROUND_COLOR,
        ),
        InkWell(
          onTap: () {
            dashboardDrawer = "Log out";
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: dashboardDrawer == "Log out"
                  ? ColorResources.BACKGROUND_COLOR
                  : Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.logout,
                  size: 28,
                  color: dashboardDrawer == "Log out"
                      ? ColorResources.COLOR_PRIMARY
                      : Colors.grey),
              title: Text(
                "Log out",
                style: TextStyle(
                    fontSize: 16,
                    color: dashboardDrawer == "Log out"
                        ? ColorResources.COLOR_PRIMARY
                        : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
