import 'package:flutter/material.dart';

Custom_alert(BuildContext context, String text) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enter Required Fields"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"))
          ],
        );
      });
}
