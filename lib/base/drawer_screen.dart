import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/styles.dart';

class CustomDrawer extends StatefulWidget {

  @override
  _CustomDrawerState createState() => _CustomDrawerState();

  const CustomDrawer();
}

class _CustomDrawerState extends State<CustomDrawer> {

  late bool isLogin;
  late bool isEnglish=true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String langCode=  'en';
    if(langCode=='en'){
      isEnglish=false;
      setState(() {
      });
    }else{
      isEnglish=true;
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  const Color(0xffF3F9FF),
      body: ListView(
        children: const [
         // CustomDrawerWidget(title: "Home", image: Images.logo_nrb, widget: MerchantDashboard())
        ],
      ),
    );

  }
}

class CustomDrawerWidget extends StatelessWidget {
  final String title;
  final String image;
  final Widget widget;
  final bool isLogout;

  const CustomDrawerWidget(
      {required this.title,

        required this.image,
        required this.widget,
        this.isLogout = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => isLogout
            ? showCupertinoDialog(

            context: context,
            barrierDismissible: false,
            builder: (_) => widget)
            : Navigator.push(
            context, MaterialPageRoute(builder: (_) => widget)),

        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        title: Text(title,
            style: LatoBold.copyWith(
                color: ColorResources.BLACK, fontSize: 14)),
        leading: Image.asset(
          image,
          height: 25,
          width: 25,
        )
    );
  }
}

Widget menuDivider(BuildContext context) {

  return Container(
    height:2,
    width: double.infinity,
    decoration: const BoxDecoration(
      color: ColorResources.WHITE,
      gradient:  LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff6D6D6D),
            Color(0xff353535),
          ])
    ),
  );
}
