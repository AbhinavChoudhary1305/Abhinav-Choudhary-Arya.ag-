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
        body: Column(children: [
          Container(
            child: QuotesRecieved(
              color: Color.fromARGB(255, 212, 131, 0),
              place: "Panchkula, Haryana",
              nameofparty: "Priyam Gupta",
              prize: "3,500/MT",
              quantity: "80MT",
              time: "12 min ago",
            ),
          ),
        ]),
      )),
    );
  }
}

class QuotesRecieved extends StatelessWidget {
  final String nameofparty;
  final String place;
  final String time;
  final String quantity;
  final String prize;
  final Color color;

  QuotesRecieved(
      {super.key,
      required this.color,
      required this.nameofparty,
      required this.place,
      required this.prize,
      required this.quantity,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameofparty,
                  style: TextStyle(
                      color: color, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  place,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(quantity,
                        style: TextStyle(
                            color: color,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text(
                      " • ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("₹" + prize,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text("Quoted Price", style: TextStyle(fontSize: 12)),
              ],
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Icon(
              Icons.access_time_rounded,
              size: 16,
            ),
            SizedBox(
              width: 2,
            ),
            Text(time),
            Spacer(),
            Icon(
              Icons.call_outlined,
              size: 16,
              color: color,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              "Call Buyer",
              style: TextStyle(color: color),
            )
          ],
        ),
      ],
    );
  }
}

class QuotesRecievedline1 extends StatelessWidget {
  final String nameofparty;
  final String place;
  final String quantity;
  final String prize;
  final Color color;

  const QuotesRecievedline1({
    required this.color,
    required this.nameofparty,
    required this.place,
    required this.prize,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nameofparty,
              style: TextStyle(
                  color: color, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              place,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(quantity,
                    style: TextStyle(
                        color: color,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text(
                  " • ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text("₹" + prize,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Text("Quoted Price", style: TextStyle(fontSize: 12)),
          ],
        )
      ],
    );
  }
}
