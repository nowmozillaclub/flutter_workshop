import 'package:flutter/material.dart';
import 'package:flutter_workshop/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Workshop',
      theme: ThemeData(primaryColor: Colors.blue, accentColor: Colors.orange),
      home: MyHomePage(),
    );
  }
}
