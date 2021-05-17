import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Colors.green.shade600;
  Color primaryColor = Colors.green.shade700;

  SizedBox mySizebox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.green.shade600,
          fontWeight: FontWeight.bold,
        ),
      );
  BoxDecoration myBoxDecoration(String namePictur) {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/image/$namePictur'), fit: BoxFit.cover),
    );
  }

  Widget titleCenter(BuildContext context, String string) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Text(
          string,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('assets/image/logo1.png'),
    );
  }

  MyStyle();
}
