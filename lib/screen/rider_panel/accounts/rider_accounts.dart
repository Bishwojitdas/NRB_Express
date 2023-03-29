import 'package:flutter/material.dart';
import 'package:nrb_express/screen/rider_panel/accounts/handover.dart';
import 'package:nrb_express/screen/rider_panel/accounts/not_handover.dart';
import 'package:nrb_express/screen/rider_panel/accounts/pending_approve.dart';
import 'package:nrb_express/utill/color_resources.dart';

class RiderAccounts extends StatefulWidget {
  const RiderAccounts({Key? key}) : super(key: key);

  @override
  _RiderAccountsState createState() => _RiderAccountsState();
}

class _RiderAccountsState extends State<RiderAccounts> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorResources.COLOR_PRIMARY_RIDER,
          bottom:const TabBar(
            tabs: [
              Tab(text: "Not Handed Over", ),
              Tab(text: "Pending", ),
              Tab(text: "Handed Over", ),
            ],
          ),
          title: Text('Rider Accounts'),
        ),
        body: const TabBarView(
          children: [
            NotHandOver(),
            PendingApprove(),
            HandOver()
          ],
        ),
      ),
    );
  }
}
