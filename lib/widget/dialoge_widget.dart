// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

DialogWidget(
  BuildContext context, {
  required String message,
  required String title,
  required Function onTap,
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            InkWell(
              child: Text('تلاش مجدد'),
              onTap: () {
                Navigator.of(context).pop();
                onTap();
              },
            ),
          ],
        ),
      );
    },
  );
}
