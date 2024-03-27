import 'package:flutter/material.dart';
import 'package:newtest/util/colors.dart';

class Meeting_option extends StatelessWidget {
  final String text;
  final bool ismute;
  final Function(bool) onchange;
  Meeting_option(
      {super.key,
      required this.text,
      required this.ismute,
      required this.onchange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: sec_bg_color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Switch.adaptive(
            value: ismute,
            onChanged: onchange,
          ),
        ],
      ),
    );
  }
}
