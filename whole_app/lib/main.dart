import 'package:flutter/material.dart';
import 'package:whole_app/whole_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whole App',
      home: WholeApp(),
    );
  }
}
