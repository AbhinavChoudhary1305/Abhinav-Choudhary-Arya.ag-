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
          child: AddCommodityPreferences(),
        ),
      )),
    );
  }
}

class AddCommodityPreferences extends StatefulWidget {
  @override
  State<AddCommodityPreferences> createState() =>
      _AddCommodityPreferencesState(commodityname: [
        "Wheat1",
        "Wheat2",
        "Wheat3",
        "Wheat4",
        "Wheat5",
        "Wheat6",
        "Wheat7",
        "Wheat8",
        "Wheat9",
        "Wheat10",
        "Wheat11"
      ], commodityimage: [
        "https://pramoda.co.in/wp-content/uploads/2018/12/Wheat.jpg",
        "https://pramoda.co.in/wp-content/uploads/2018/12/Wheat.jpg",
        "https://pramoda.co.in/wp-content/uploads/2018/12/Wheat.jpg",
        "https://pramoda.co.in/wp-content/uploads/2018/12/Wheat.jpg",
        "https://pramoda.co.in/wp-content/uploads/2018/12/Wheat.jpg",
        "https://pramoda.co.in/wp-content/uploads/2018/12/Wheat.jpg",
        "https://pramoda.co.in/wp-content/uploads/2018/12/Wheat.jpg",
        "https://pramoda.co.in/wp-content/uploads/2018/12/Wheat.jpg",
        "https://pramoda.co.in/wp-content/uploads/2018/12/Wheat.jpg",
        "https://pramoda.co.in/wp-content/uploads/2018/12/Wheat.jpg",
        "https://pramoda.co.in/wp-content/uploads/2018/12/Wheat.jpg"
      ]);
}

class _AddCommodityPreferencesState extends State<AddCommodityPreferences> {
  final List<String> commodityname;
  final List<String> commodityimage;
  _AddCommodityPreferencesState(
      {required this.commodityname, required this.commodityimage});
  late int lengthoflist = commodityname.length;
  late List<bool> flag = List.filled(lengthoflist, false);

  commodity<Widget>(
      String image, String commodity, int index, bool tap, bool select) {
    return InkWell(
      onTap: () {
        setState(() {
          flag[index] = !flag[index];
        });
      },
      child: Stack(children: [
        Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 45,
              child: CircleAvatar(
                backgroundImage: NetworkImage(image),
                radius: 40,
                child: tap != false
                    ? Icon(
                        Icons.check,
                        size: 50,
                      )
                    : Container(),
              ),
            ),
            Text(
              commodity,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            )
          ],
        ),
        Positioned(
          right: 0,
          child: select != false
              ? CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.close),
                )
              : Container(),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "Selected Commodities",
          style: TextStyle(fontSize: 20),
        ),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int k = 0; k < lengthoflist; k++) ...{
                  if (flag[k]) ...{
                    Stack(
                      children: [
                        commodity(commodityimage[k], commodityname[k], k, false,
                            true),
                      ],
                    )
                  }
                }
              ],
            ),
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Add Commodity Preferences",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Tap on a commodity to select more preferences",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 12,
          ),
          GridView(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120,
                  childAspectRatio: 0.99,
                  mainAxisExtent: 120),
              shrinkWrap: true,
              children: [
                for (int i = 0; i < lengthoflist; i++) ...{
                  commodity(
                      commodityimage[i], commodityname[i], i, flag[i], false)
                }
              ]),
        ]),
      ],
    );
  }
}
