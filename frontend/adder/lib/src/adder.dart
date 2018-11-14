import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Adder extends StatefulWidget {
  @override
  AdderState createState() {
    return AdderState();
  }
}

class AdderState extends State<Adder> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Num 1:'),
                SizedBox(width: 32.0),
                Expanded(
                  child: TextField(
                    controller: num1Controller,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Num 2:'),
                SizedBox(width: 32.0),
                Expanded(
                  child: TextField(
                    controller: num2Controller,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            RaisedButton(
              onPressed: calculateResult,
              child: Text('Add'),
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Those Two added: '),
                Text('$result'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void calculateResult() {
    if (num1Controller.text.isEmpty || num2Controller.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Please enter valid integers'),
      ));
      return;
    }
    addTwoNumbers(
            int.parse(num1Controller.text), int.parse(num2Controller.text))
        .then((value) {
      setState(() {
        result = value;
      });
    });
  }

  Future<int> addTwoNumbers(int num1, int num2) async {
    http.Response response =
        await http.post('http://localhost:8080/adder', body: {
      'a': '$num1',
      'b': '$num2',
    });
    if (response?.statusCode == 200) {
      var data = response.body;
      return int.parse(data);
    }
    return null;
  }
}
