import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ID Card',
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 248, 188),
          appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 58, 181, 62),
              title: Text("ID Card")),
          body: Column(
            children: [
              Stack(children: [
                Column(
                  children: [
                    Container(
                      child: Image.network(
                          "https://static.vecteezy.com/system/resources/previews/000/692/604/original/party-crowd-banner-design-vector.jpg"),
                    ),
                    SizedBox(
                      height: 50,
                      width: 500,
                    ),
                  ],
                ),
                Positioned(
                  right: 140,
                  top: 110,
                  child: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      radius: 75,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            "https://www.themoviedb.org/t/p/w500/bBRlrpJm9XkNSg0YT5LCaxqoFMX.jpg"),
                      )),
                ),
              ]),
              Container(
                height: 300,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 500,
                    ),
                    Container(
                      child: Text("Name - Abhinav Choudhary",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      color: Color.fromARGB(255, 126, 201, 128),
                      height: 50,
                      width: 500,
                    ),
                    Spacer(),
                    Container(
                      child: Text("Age - 19",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      color: Color.fromARGB(255, 142, 207, 145),
                      height: 50,
                      width: 500,
                    ),
                    Spacer(),
                    Container(
                      child: Text("Gender - M",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      color: Color.fromARGB(255, 126, 201, 128),
                      height: 50,
                      width: 500,
                    ),
                    Spacer(),
                    Container(
                      child: Text("Dipartment - CSE",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      color: Color.fromARGB(255, 142, 207, 145),
                      height: 50,
                      width: 500,
                    ),
                    Spacer(),
                    Container(
                      child: Text("College - MIT Blr",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      color: Color.fromARGB(255, 126, 201, 128),
                      height: 50,
                      width: 500,
                    ),
                    Spacer(),
                    Container(
                      child: Text("Application No. - 225805001",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      color: Color.fromARGB(255, 142, 207, 145),
                      height: 50,
                      width: 500,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
