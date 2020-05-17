import 'package:flushbar/flushbar_helper.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showError(BuildContext context, message) {
  Flushbar(
    message: message,
    mainButton: FlatButton(
        onPressed: () {},
        child: Icon(
          Icons.error_outline,
          size: 28,
          color: Colors.red.shade400,
        )),
    leftBarIndicatorColor: Colors.red.shade400,
    duration: Duration(seconds: 3),
  )..show(context);
}

void showInfo(BuildContext context, message) {
  Flushbar(
    message: message,
    mainButton: FlatButton(
        onPressed: () {},
        child: Icon(
          Icons.info_outline,
          size: 28,
          color: Colors.blue.shade400,
        )),
    leftBarIndicatorColor: Colors.blue.shade400,
    duration: Duration(seconds: 3),
  )..show(context);
}
