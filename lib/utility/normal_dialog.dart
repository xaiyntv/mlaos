import 'package:flutter/material.dart';

Future<void> normalDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(message),
      children: <Widget>[
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('ok'),
        ),
      ],
    ),
  );
}
