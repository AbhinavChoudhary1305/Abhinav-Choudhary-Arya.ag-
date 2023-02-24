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
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AverageQuality(
            listlenght: 5,
            parameterl: [
              "Broken, Shriveled & Immature",
              "Moisture",
              "Foreign Matter",
              "Past Damaged",
              "Fungus"
            ],
            precentagel: ["11.5", "15", "2", "7", "1"],
          ),
        ),
      )),
    );
  }
}

class AverageQuality extends StatelessWidget {
  final List<String> parameterl;
  final List<String> precentagel;
  final int listlenght;

  const AverageQuality(
      {required this.listlenght,
      required this.parameterl,
      required this.precentagel});

  Parameter<Widget>(
      String parameter, String precentage, bool first, bool last) {
    return Container(
      decoration: first != false
          ? BoxDecoration(
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ))
          : last != false
              ? BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)))
              : BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  parameter,
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Text(
                  precentage + "%",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 180, 255, 186)),
                height: 4,
                width: double.infinity,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: 4,
                          width: (constraints.maxWidth / 100) *
                              (double.parse(precentage)),
                          color: Color.fromARGB(255, 0, 93, 70)),
                    ],
                  );
                }))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Card(
        elevation: 3,
        child: Column(
          children: [
            for (int i = 0; i < listlenght; i++) ...{
              Parameter(parameterl[i], precentagel[i], i == 0 ? true : false,
                  i == (listlenght - 1) ? true : false),
              Container(
                decoration: i != listlenght
                    ? BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 0.1, // soften the shadow
                            spreadRadius: 0.2, //extend the shadow
                            offset: Offset(
                              0,
                              1.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      )
                    : BoxDecoration(),
              )
            },
          ],
        ),
      )
    ]);
  }
}
