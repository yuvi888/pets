import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void showCustomAlertDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          // Prevent the dialog from being dismissed with the back button
          return true;
        },
        child: AlertDialog(
          backgroundColor: const Color.fromRGBO(36, 36, 36, 0.934),
          title: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 15,
            ),
          ),
        ),
      );
    },
  );
}
