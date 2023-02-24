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
      title: 'Day 3',
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 251, 217),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  //Card
                  CustomPrize(
                      changefrom: "since last week",
                      commoditylocation:
                          "Shivaji Mandi, Lucknow, Uttar Pradesh",
                      commodityname: "Maize",
                      commodityprize: "₹23,500/MT",
                      prizechange: "-12.6%,₹450")
                ],
              ),
            )),
      ),
    );
  }
}

class CustomPrize extends StatelessWidget {
  final String commodityname;
  final String commodityprize;
  final String prizechange;
  final String changefrom;
  final String commoditylocation;

  const CustomPrize(
      {required this.changefrom,
      required this.commoditylocation,
      required this.commodityname,
      required this.commodityprize,
      required this.prizechange});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: [
              //Prize details
              CommodityPrizeDetails(
                  changefrom: changefrom,
                  commodityname: commodityname,
                  commodityprize: commodityprize,
                  prizechange: prizechange),
              //Location
              CommodityLocation(
                commoditylocation: commoditylocation,
              )
            ],
          )),
    );
  }
}

class CommodityLocation extends StatelessWidget {
  final String commoditylocation;

  const CommodityLocation({required this.commoditylocation});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 229, 229, 229),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Color.fromARGB(255, 113, 113, 113),
              size: 20,
            ),
            Text(
              commoditylocation,
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}

class CommodityPrizeDetails extends StatelessWidget {
  final String commodityname;
  final String commodityprize;
  final String prizechange;
  final String changefrom;

  const CommodityPrizeDetails(
      {required this.changefrom,
      required this.commodityname,
      required this.commodityprize,
      required this.prizechange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            commodityname,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                commodityprize,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                " • ",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                prizechange,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              SizedBox(width: 4),
              Text(
                changefrom,
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ]),
      ),
    );
  }
}
