import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newtest/util/colors.dart';

class Home_meeting_button extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onpressed;
  const Home_meeting_button(
      {super.key,
      required this.onpressed,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GestureDetector(
        onTap: onpressed,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: btn_color,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.06),
                      offset: Offset(0, 4)),
                ],
              ),
              width: 60,
              height: 60,
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
