import 'package:flutter/material.dart';
import 'package:mlao/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Null> signOutPreocess(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  // exit(0);

  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => Home(),
  );
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}
