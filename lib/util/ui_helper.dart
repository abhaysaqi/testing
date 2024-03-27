import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newtest/util/border.dart';
import 'package:newtest/util/colors.dart';

class Ui_helper {
  static Custom_btn(
      {required final String text,
      TextStyle? style,
      EdgeInsetsGeometry? padding,
      ButtonStyle? elevated_style,
      required VoidCallback onpressed}) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
          style: elevated_style ??
              ElevatedButton.styleFrom(
                  backgroundColor: btn_color,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
          onPressed: onpressed,
          child: Text(text,
              style: style ??
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    );
  }

  // ignore: non_constant_identifier_names
  static custom_textfield({
    required TextEditingController controller,
    required bool to_hide,
    required String text,
    required IconData prefix_icon,
    IconData? suffix_icon,
    GestureDetector? gestureDetector,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextField(
          controller: controller,
          obscureText: to_hide,
          decoration: InputDecoration(
              labelText: text,
              prefixIcon: Icon(prefix_icon),
              suffixIcon: Icon(suffix_icon),
              border: outlineInputBorder)),
    );
  }
}
