
import 'package:flutter/material.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'dimensions.dart';

const LatoLight = TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w300,
);

const LatoRegular = TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w400,
);

const LatoMedium = TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w500,
);

const LatoBlack = TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w500,
);

const LatoSemiBold = TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w600,
);


const LatoBold = TextStyle(
  fontFamily: 'Lato',
  fontSize: Dimensions.FONT_SIZE_DEFAULT,
  fontWeight: FontWeight.w700,
);

textFieldDecoration(){
  return BoxDecoration(
    color: ColorResources.TEXT_FIELD_BG,
    borderRadius: BorderRadius.circular(30),
  );
}


textFieldDecorationWithShadow() {
  return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      color: ColorResources.COLOR_PRIMARY,
      boxShadow: [
        BoxShadow(
          color: ColorResources.COLOR_PRIMARY.withOpacity(0.07),
          blurRadius: 4,
          spreadRadius: 5,
        )
      ]
  );
}

textFieldFocusBorder() {
  return const OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(30)) ,
      borderSide: BorderSide(
          color: ColorResources.COLOR_PRIMARY,
          width: 2
      )
  );
}
textFieldInputBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(50)
  );
}

class IconText extends StatelessWidget {

  IconData icon;
  String? title;
  IconText({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: (){},
            icon: Icon(icon, color: ColorResources.FONT_GREY)),
        SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: Text(title!, style: LatoRegular.copyWith(fontSize: 16, color: ColorResources.FONT_GREY, fontWeight: FontWeight.normal,),)),
      ],
    );
  }
}

class GetStartd extends StatelessWidget {

  Function onTab;
  String? title;

  GetStartd({Key? key,required this.title, required this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => onTab()));
      },
      child: Container(
        height: 45,
        width: 160,
        decoration: BoxDecoration(
            color: ColorResources.COLOR_PRIMARY,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Center(child: Text("GET STARTED", style: LatoBold.copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),)),
      ),
    );
  }
}

