import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SafeArea(
          child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 250, 209),
        body: CoustomMandi(
            imagecommodity:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ3bwc9oSMUlmAZE_tYpWf13LWiMckbYFt3zUoofFbqD7j-5pm4w0jOToE7kCmzXTOAoI&usqp=CAU",
            commodityname: "Rice",
            commodityprize: "₹23,500/MT",
            commoditylocation: "MG Mandi, Agra",
            prizechange: "+12.6%, ₹450",
            changefrom: "since last week",
            printtext: () {
              PrintText();
            }),
      )),
    );
  }
}

void PrintText() {
  print("The Card is Taped");
}

class CoustomMandi extends StatelessWidget {
  final String? imagecommodity;
  final String? commodityname;
  final String? commodityprize;
  final String? commoditylocation;
  final String? prizechange;
  final String? changefrom;
  final Function printtext;

  const CoustomMandi(
      {required this.imagecommodity,
      required this.commodityname,
      required this.commodityprize,
      required this.commoditylocation,
      required this.prizechange,
      required this.changefrom,
      required this.printtext});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: new InkWell(
        onTap: () {
          printtext();
          //print("Taped");
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Row(children: [
            //Right Section
            CoustomMandiRight(
              imagecommoditysec:
                  imagecommodity ?? "https://img.arya.ag//home/arya-logo.png",
            ),
            //Left Section
            CoustomMandiLeft(
                changefrom: changefrom ?? "can not tell the last date",
                commoditylocation: commoditylocation ?? "Location not found",
                commodityname: commodityname ?? "Unidentified Commocity",
                commodityprize: commodityprize ?? "Prize Not Updated",
                prizechange: prizechange ?? "Last prize not found")
          ]),
        ),
      ),
    );
  }
}

class CommodityPrizeBar extends StatelessWidget {
  final String prizechange;
  final String changefrom;

  const CommodityPrizeBar(
      {required this.changefrom, required this.prizechange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 218, 218, 218),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            Text(
              prizechange,
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              changefrom,
              style: TextStyle(
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CommodityDetails extends StatelessWidget {
  final String commodityname;
  final String commodityprize;
  final String commoditylocation;

  const CommodityDetails(
      {required this.commoditylocation,
      required this.commodityname,
      required this.commodityprize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            commodityname,
            style: TextStyle(color: Color.fromARGB(255, 165, 186, 203)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            commodityprize,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            commoditylocation,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CoustomMandiLeft extends StatelessWidget {
  final String commodityname;
  final String commodityprize;
  final String commoditylocation;
  final String prizechange;
  final String changefrom;

  const CoustomMandiLeft(
      {required this.changefrom,
      required this.commoditylocation,
      required this.commodityname,
      required this.commodityprize,
      required this.prizechange});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: 111,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Details Section
              CommodityDetails(
                  commoditylocation: commoditylocation,
                  commodityname: commodityname,
                  commodityprize: commodityprize),
              Spacer(),
              // Prize Bar
              CommodityPrizeBar(
                  changefrom: changefrom, prizechange: prizechange),
            ]),
      ),
    );
  }
}

class CoustomMandiRight extends StatelessWidget {
  final String imagecommoditysec;
  const CoustomMandiRight({required this.imagecommoditysec});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 111,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12), topLeft: Radius.circular(12)),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.network(
              imagecommoditysec,
              height: 111,
              fit: BoxFit.cover,
            ),
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
