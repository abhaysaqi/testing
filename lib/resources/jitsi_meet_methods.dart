// import 'dart:js';
import 'package:jitsi_meet_fix/feature_flag/feature_flag.dart';
import 'package:jitsi_meet_fix/jitsi_meet.dart';
import 'package:newtest/resources/auth_methods.dart';
import 'package:newtest/resources/firestore_methods.dart';


class Jitsi_meet_methods {
  final Auth_methods _auth_methods = Auth_methods();
  final Firestore_methods _firestore_methods = Firestore_methods();
  void Create_new_meeting({
    required String roomname,
    required bool Audio_muted,
    required bool Video_muted,
    String username = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      String name;
      if (username.isEmpty) {
        name = _auth_methods.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(room: roomname)
        ..userDisplayName = name
        ..userEmail = _auth_methods.user.email
        ..userAvatarURL = _auth_methods.user.photoURL // or .png
        ..audioMuted = Audio_muted
        ..videoMuted = Video_muted;
      _firestore_methods.Add_meeting_history(roomname);
      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      //   Custom_alert(context as BuildContext, "data");
      // }
    }
  }
}
