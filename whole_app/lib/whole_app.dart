import 'package:flutter/material.dart';
import 'package:adder/adder.dart';
import 'package:word_counter/word_counter.dart';

class WholeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Adder'),
              Tab(text: 'Word Counter'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Adder(),
            WordCounter(),
          ],
        ),
      ),
    );
  }
}
