import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RangeValues _currentRangevalue = const RangeValues(50000, 5000000);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Range slider',
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 251, 213),
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price Range",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  RangeBar(),
                ],
              ),
            )),
      ),
    );
  }
}

class RangeBar extends StatefulWidget {
  const RangeBar({super.key});

  @override
  State<RangeBar> createState() => _RangeBarState();
}

class _RangeBarState extends State<RangeBar> {
  RangeValues _currentRangevalue = const RangeValues(50000, 5000000);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.black,
              inactiveTrackColor: Colors.grey,
              thumbColor: Colors.black,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
              overlayColor: Color.fromARGB(255, 50, 161, 216),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20)),
          child: RangeSlider(
            values: _currentRangevalue,
            max: 5000000,
            min: 50000,
            divisions: 49500,
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangevalue = values;
              });
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Minimum",
                    style: TextStyle(
                        color: Color.fromARGB(255, 9, 129, 227),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "₹" + _currentRangevalue.start.round().toString(),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Maximum",
                    style: TextStyle(
                        color: Color.fromARGB(255, 9, 129, 227),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "₹" + _currentRangevalue.end.round().toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  )
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
