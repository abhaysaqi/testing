// import 'dart:js';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:newtest/resources/jitsi_meet_methods.dart';
import 'package:newtest/util/home_meeting_button.dart';

class Meeting_screen extends StatelessWidget {
  Meeting_screen({super.key});

  final Jitsi_meet_methods _jitsi_meet_methods = Jitsi_meet_methods();
  Create_New_Meeting() async {
    var random = Random();
    String roomname =
        (random.nextInt(10000)).toString() + (random.nextInt(10000).toString());
    _jitsi_meet_methods.Create_new_meeting(
        roomname: roomname, Audio_muted: true, Video_muted: true);
  }

  Join_meeting(BuildContext context) {
    Navigator.pushNamed(context, 'video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Home_meeting_button(
              onpressed: () {
                Create_New_Meeting();
              },
              text: "New Meeting",
              icon: Icons.videocam_rounded,
            ),
            Home_meeting_button(
              onpressed: () => Join_meeting(context),
              text: "Join Meeting",
              icon: Icons.add_box_rounded,
            ),
            Home_meeting_button(
              onpressed: () {},
              text: "Schedule",
              icon: Icons.calendar_today_rounded,
            ),
            Home_meeting_button(
              onpressed: () {},
              text: "Share Screen",
              icon: Icons.arrow_upward_rounded,
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Text(
              "Create/Join Meetings",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
