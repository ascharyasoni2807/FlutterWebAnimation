import 'package:flutter/material.dart';
import 'package:web/homePage.dart';
import './strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: Strings.homepageName),
    );
  }
}
