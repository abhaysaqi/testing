import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:newtest/resources/auth_methods.dart';
import 'package:newtest/resources/jitsi_meet_methods.dart';
import 'package:newtest/util/colors.dart';
import 'package:newtest/util/meeting_option.dart';

class Video_call_screen extends StatefulWidget {
  const Video_call_screen({super.key});

  @override
  State<Video_call_screen> createState() => _Video_call_screenState();
}

class _Video_call_screenState extends State<Video_call_screen> {
  final Auth_methods _auth_methods = Auth_methods();
  late TextEditingController meeting_id_controller;
  late TextEditingController name_controller;

  final Jitsi_meet_methods _jitsi_meet_methods = Jitsi_meet_methods();
  bool Audio_muted = false;
  bool Video_muted = false;

  @override
  void initState() {
    meeting_id_controller = TextEditingController();
    name_controller =
        TextEditingController(text: _auth_methods.user.displayName);
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   meeting_id_controller.dispose();
  //   name_controller.dispose();
  //   JitsiMeet.removeAllListeners();
  //   // JitsiMeet().closeChat();
  // }
  @override
void dispose() {
  super.dispose();
  meeting_id_controller.dispose();
  name_controller.dispose();
  // JitsiMeet.removeAllListeners();
  // JitsiMeet.endMeeting();
  // You can uncomment the following line if you want to close the chat as well
  // JitsiMeet.closeChat();
}


  _join_meeting() {
    _jitsi_meet_methods.Create_new_meeting(
        roomname: meeting_id_controller.text,
        Audio_muted: Audio_muted,
        Video_muted: Video_muted,
        username: name_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bg_color,
        title: Text(
          "Join a Meeting",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meeting_id_controller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: sec_bg_color,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Room ID",
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: name_controller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: sec_bg_color,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Name",
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _join_meeting,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Join",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Meeting_option(
              text: "Mute Audio",
              ismute: Audio_muted,
              onchange: On_Audio_muted()),
          Meeting_option(
              text: "Turn Off My Video",
              ismute: Video_muted,
              onchange: On_Video_muted()),
        ],
      ),
    );
  }

  On_Audio_muted() {
    setState(() {
      Audio_muted = !Audio_muted;
    });
  }

  On_Video_muted() {
    setState(() {
      Video_muted = !Video_muted;
    });
  }
}
