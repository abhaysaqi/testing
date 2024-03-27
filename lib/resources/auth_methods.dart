import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newtest/util/snackbar.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final class Auth_methods {
  User get user => _auth.currentUser!;
  Signin_with_Google(BuildContext context) async {
    try {
      final GoogleSignInAccount? google_user = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? google_auth =
          await google_user?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: google_auth?.accessToken,
          idToken: google_auth?.accessToken);
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } on FirebaseAuthException catch (ex) {
      Custom_alert(context, ex.message.toString());
    }
  }

  Signup_with_Emai_Pass(BuildContext context, String email, String password) async {
  if (email.isEmpty || password.isEmpty) {
    Custom_alert(context, "Fill Mandatory Fields");
  } else {
    UserCredential? userCredential;
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      User? user = userCredential.user;
      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Custom_alert(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Custom_alert(context, 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        Custom_alert(context, 'The email address is not valid.');
      } else {
        Custom_alert(context, e.message.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}

  Signin_with_Emai_Pass(
      BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
    Custom_alert(context, "Fill Mandatory Fields");
  } else {
    UserCredential? userCredential;
    try {
        userCredential = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      User? user = userCredential.user;
      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Custom_alert(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Custom_alert(context, 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        Custom_alert(context, 'The email address is not valid.');
      } else {
        Custom_alert(context, e.message.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}
}
