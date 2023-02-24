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
        backgroundColor: Color.fromARGB(255, 255, 251, 219),
        appBar: AppBar(
          title: Text("The calender app"),
        ),
        body: Container(
          
          )
      )),
    );
  }
}


