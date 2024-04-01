import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newtest/util/snackbar.dart';
import 'package:newtest/util/ui_helper.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

final class Auth_methods {
  User get user => _auth.currentUser!;
  Signin_with_Google(BuildContext context) async {
    bool response = false;
    try {
      final GoogleSignInAccount? google_user = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? google_auth =
          await google_user?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: google_auth?.accessToken, idToken: google_auth?.idToken);
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser){
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        response = true;
        Custom_alert(context, "Successfully signed in!");
        Navigator.pushReplacementNamed(context, '/home');
      }
    } on FirebaseAuthException catch (ex) {
      Custom_alert(context, ex.message.toString());
    }
  }

  Signup_with_Emai_Pass(
      BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Custom_alert(context, "Fill Mandatory Fields");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
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
        Custom_alert(context, e.toString());
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
            email: email, password: password);
        User? user = userCredential.user;
        if (user != null) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          Custom_alert(context, 'The account already exists for that email.');
        } else {
          // Handle other exceptions
          Custom_alert(context, e.message.toString());
        }
      } catch (e) {
        Custom_alert(context, e.toString());
      }
    }
  }

  void Sign_out() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
