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
              body: ListView(scrollDirection: Axis.horizontal, children: [
        Commoditylist(
          commodity: ["Wheat", "Rice", "Maiz", "Cumin", "Cumin"],
          image: [
            "https://pramoda.co.in/wp-content/uploads/2018/12/Wheat.jpg",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKaX8JU-FT6VodjMfi6z6t9lcq6KL2ElvXzg&usqp=CAU",
            "https://www.apnikheti.com/upload/crops/9634idea99Maize_cover.jpg",
            "https://4.imimg.com/data4/YG/BR/MY-13479/indian-cumin-seeds-500x500.jpg",
            "https://4.imimg.com/data4/YG/BR/MY-13479/indian-cumin-seeds-500x500.jpg"
          ],
          listlength: 5,
        ),
      ]))),
    );
  }
}

class Commoditylist extends StatefulWidget {
  final List<String> commodity;
  final List<String> image;
  final int listlength;

  Commoditylist(
      {required this.commodity, required this.image, required this.listlength});

  @override
  State<Commoditylist> createState() => _CommoditylistState(
      commodityl: commodity, imagel: image, listlength: listlength);
}

class _CommoditylistState extends State<Commoditylist> {
  final List<String> imagel;
  final List<String> commodityl;
  final int listlength;

  int? flag = null;

  _CommoditylistState(
      {required this.imagel,
      required this.commodityl,
      required this.listlength});

  commodity<Widget>(String image, String commodity, bool tapinp, int i) {
    bool tap = tapinp;
    return InkWell(
      child: Column(
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: tap != false
                ? Color.fromARGB(255, 0, 99, 82)
                : Colors.transparent,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(image),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            commodity,
            style: TextStyle(
                fontSize: 20,
                color: tap != false
                    ? Color.fromARGB(255, 0, 99, 82)
                    : Colors.black,
                fontWeight: tap != false ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
      onTap: () {
        setState(() {
          flag = i;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < listlength; i++)
          commodity(imagel[i], commodityl[i],
              flag != null && flag == i ? true : false, i)
      ],
    );
  }
}
