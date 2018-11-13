import 'package:flutter/material.dart';
import 'package:word_counter/word_counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Counter',
      home: WordCounter(),
    );
  }
}
