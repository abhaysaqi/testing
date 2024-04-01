// // import 'dart:js';
// import 'package:newtest/resources/auth_methods.dart';
// import 'package:newtest/resources/firestore_methods.dart';
// import 'package:eko_jitsi/eko_jitsi.dart';
// import 'package:eko_jitsi/feature_flag/feature_flag_enum.dart';


// class Jitsi_meet_methods {
//   final Auth_methods _auth_methods = Auth_methods();
//   final Firestore_methods _firestore_methods = Firestore_methods();
//   // final JitsiMeet jitsiMeet = JitsiMeet();
//   void Create_new_meeting({
//     required String roomname,
//     required bool Audio_muted,
//     required bool Video_muted,
//     String username = '',
//   }) async {
//     try {
//       String name;
//       if (username.isEmpty) {
//         name = _auth_methods.user.displayName!;
//       } else {
//         name = username;
//       }
//       var options = JitsiMeetingOptions(room: roomname)
//         ..userDisplayName = name
//         ..userEmail = _auth_methods.user.email
//         ..userAvatarURL = _auth_methods.user.photoURL // or .png
//         ..audioMuted = Audio_muted
//         ..videoMuted = Video_muted;
//       _firestore_methods.Add_meeting_history(roomname);
//       await JitsiMeet.joinMeeting(options);
//     } catch (e) {
//       //   Custom_alert(context as BuildContext, "data");
//       // }
//     }
//   }
// }

import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:newtest/resources/auth_methods.dart';
import 'package:newtest/resources/firestore_methods.dart';

class Jitsi_meet_methods  {
      final Auth_methods _auth_methods = Auth_methods();
      final Firestore_methods _firestore_methods = Firestore_methods();
      final JitsiMeet jitsiMeet = JitsiMeet();

  void Create_new_meeting({
    required String roomname,
    required bool Audio_muted,
    required bool Video_muted,
    String username = '',
  }) async {
    try {
      String name;
      if (username.isEmpty) {
        name = _auth_methods.user.displayName!;
      } else {
        name = username;
      }

      var options = JitsiMeetConferenceOptions(
        room: roomname,
        configOverrides: {
          "startWithAudioMuted": Audio_muted,
          "startWithVideoMuted": Video_muted,
        },
        userInfo: JitsiMeetUserInfo(
          displayName: name,
          email: _auth_methods.user.email,
          avatar: _auth_methods.user.photoURL,
        ),
      //   featureFlags: {
      //   "unsaferoomwarning.enabled": false
      // },
      );
      _firestore_methods.Add_meeting_history(roomname);
      await jitsiMeet.join(options);
    } catch (e) {
      print("Error starting meeting: $e");
      throw e;
    }
  }
}
