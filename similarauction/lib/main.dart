import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 300,
                  child: SimilarAuctions(
                    auctionid: "AR 786",
                    commodity: "Soyabean, Golden",
                    islive: true,
                    location: "Lakhimpur Khiri, Uttar Pradesh",
                    quantity: "150 MT",
                    time: "Ends in 00:12:34",
                    percent: "20",
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  width: 300,
                  child: SimilarAuctions(
                    auctionid: "AR 786",
                    commodity: "Soyabean, Golden",
                    islive: true,
                    location: "Lakhimpur Khiri, Uttar Pradesh",
                    quantity: "150 MT",
                    time: "Ends in 00:12:34",
                    percent: "20",
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  width: 300,
                  child: SimilarAuctions(
                    auctionid: "AR 786",
                    commodity: "Soyabean, Golden",
                    islive: true,
                    location: "Lakhimpur Khiri, Uttar Pradesh",
                    quantity: "150 MT",
                    time: "Ends in 00:12:34",
                    percent: "20",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SimilarAuctions extends StatelessWidget {
  final bool islive;
  final String commodity;
  final String quantity;
  final String location;
  final String time;
  final String auctionid;
  final String percent;

  const SimilarAuctions(
      {required this.auctionid,
      required this.commodity,
      required this.islive,
      required this.location,
      required this.quantity,
      required this.time,
      required this.percent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 22,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 172, 255, 229),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      commodity,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      quantity,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 22,
                        ),
                        Expanded(
                          child: Text(
                            location,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 22,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(time,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        height: 4,
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 4,
                                  width: (constraints.maxWidth / 100) *
                                      (int.tryParse(percent) ?? 0),
                                  color: Color.fromARGB(255, 0, 93, 70)),
                            ],
                          );
                        })),
                  ],
                ),
              ),
            ),
            if (islive == true) ...{
              Positioned(
                top: 10,
                right: 30,
                child: Container(
                  decoration: (BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 255, 102, 0),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 6, bottom: 6),
                    child: Text(
                      "Live",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            },
            Positioned(
              top: -20,
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 70, 49),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 6, bottom: 6),
                  child: Text(
                    auctionid,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
