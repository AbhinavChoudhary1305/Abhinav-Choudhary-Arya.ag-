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
      title: 'Function Call',
      home: SafeArea(
          child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 249, 196),
        body: Container(
          color: Colors.blue,
          height: 400,
          width: 400,
          child: Row(
            children: [
              TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {},
                  child: Text("Red")),
                  TextButton(
                    style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.green)),
                    onPressed: (){}, child: Text("Green"))
            ],
          ),
        ),
      )),
    );
  }
}
