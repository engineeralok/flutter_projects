import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Column(
          children: const <Widget>[
            CircleAvatar(),
            Text("Hello World!"),
            Text("This is My first App"),
            Card(child: ListTile(leading: Icon(Icons.phone),),),
            Card()
          ],
        ),
      ),
    );
  }
}
