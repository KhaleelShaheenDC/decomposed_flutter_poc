import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  void inputChanged(text) {
    calculateWords(text).then((value) {
      setState(() {
        result = value;
      });
    });
  }

  Future<int> calculateWords(String text) async {
    http.Response response =
        await http.post('http://localhost:8080/wordcounter', body: {
      'words': text,
    });
    if (response?.statusCode == 200) {
      var data = response.body;
      return int.parse(data);
    }
    return null;
  }
}
