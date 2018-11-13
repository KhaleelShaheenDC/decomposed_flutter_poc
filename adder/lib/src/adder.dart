import 'package:flutter/material.dart';

class Adder extends StatefulWidget {
  @override
  AdderState createState() {
    return AdderState();
  }
}

class AdderState extends State<Adder> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onChanged: inputChanged,
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
                    onChanged: inputChanged,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
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

  void inputChanged(v) {
    setState(() {
      result = addTwoNumbers(
          int.parse(num1Controller.text), int.parse(num2Controller.text));
    });
  }

  int addTwoNumbers(int num1, int num2) {
    return num1 + num2;
  }
}
