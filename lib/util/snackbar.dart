import 'package:flutter/material.dart';

Custom_alert(BuildContext context, String text, {VoidCallback? onpressed}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
                onPressed: onpressed ?? () => Navigator.pop(context),
                child: Text("ok"))
          ],
        );
      });
}
