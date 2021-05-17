import 'package:flutter/material.dart';
import 'package:mlao/screen/home.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'MLAO',
      home: Home(),
    );
  }
}
