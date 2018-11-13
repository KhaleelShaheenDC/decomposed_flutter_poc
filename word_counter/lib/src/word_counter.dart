import 'package:flutter/material.dart';

class WordCounter extends StatefulWidget {
  @override
  _WordCounterState createState() => _WordCounterState();
}

class _WordCounterState extends State<WordCounter> {
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Words'),
            TextField(
              onChanged: inputChanged,
            ),
            Row(
              children: <Widget>[
                Text('Word count: '),
                Text('$result'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void inputChanged(value) {
    setState(() {
      result = calculateWords(value);
    });
  }
  final unixNewLine = '\n';


  int calculateWords(String text) {
    var words = text.split(' ');
    words.removeWhere((word) => word.length == 0 || word == " ");
    return words.length;
  }
}
