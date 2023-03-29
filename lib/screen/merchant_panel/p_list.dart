import 'package:flutter/material.dart';
import 'package:nrb_express/utill/images.dart';

class PList extends StatefulWidget {
  const PList({Key? key}) : super(key: key);

  @override
  _PListState createState() => _PListState();
}

class _PListState extends State<PList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            Container(
              width: MediaQuery.of(context).size.width-40,
              height: MediaQuery.of(context).size.width-40,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: const BorderRadius.all(Radius.circular(30))
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width-40,
                    height: MediaQuery.of(context).size.width-135,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/1,
                          height: MediaQuery.of(context).size.width/1,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 50, right: 50, top: 40, bottom: 10 ),
                          transform: Matrix4.translationValues( 0.33, 0.33, 0.33)
                            ..rotateZ(-28  / 180),
                          decoration: BoxDecoration(
                              color: Colors.blue.shade100.withOpacity(0.6),
                              borderRadius: const BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                        Positioned(
                          left: 20,
                          right: 20,
                          //top: 5,
                          child: Image.asset(Images.shoe_1),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Feature Product Name", style: TextStyle(fontSize: 14,), ),
                          Text("Feature Product Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800), ),
                          Text("\$ 45.6", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.blue), ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                        ),
                        child: const Icon(
                          Icons.shopping_cart,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width-40,
              height: MediaQuery.of(context).size.width-40,
              padding:const EdgeInsets.all(10),
              margin:const EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.deepOrange.shade50,
                  borderRadius:const BorderRadius.all(Radius.circular(30))
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width-40,
                    height: MediaQuery.of(context).size.width-135,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/1.5,
                          height: MediaQuery.of(context).size.width/1.5,
                          alignment: Alignment.center,
                          margin:const EdgeInsets.only(left: 60, right: 60, top: 0, bottom: 40 ),
                          transform: Matrix4.translationValues( 0.33, 0.33, 0.33)
                            ..rotateZ(28 / 180),
                          decoration: BoxDecoration(
                              color: Colors.deepOrange.shade100.withOpacity(0.6),
                              borderRadius:const BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                        Positioned(
                          left: 20,
                          right: 20,
                          //top: 5,
                          child: Image.asset(Images.shoe_1),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Feature Product Name", style: TextStyle(fontSize: 14,), ),
                          Text("Feature Product Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800), ),
                          Text("\$ 45.6", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.blue), ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:const BorderRadius.all(Radius.circular(10))
                        ),
                        child:const Icon(
                          Icons.shopping_cart,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
