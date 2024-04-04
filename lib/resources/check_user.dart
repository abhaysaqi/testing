import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({Key? key}) : super(key: key);

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      checkUser();
    });
  }

  Future<void> checkUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await Navigator.pushReplacementNamed(context, '/home');
    } else {
      await Navigator.pushReplacementNamed(context, '/first');
    }
  }

  @override
  Widget build(BuildContext context) {
    // You can return any placeholder widget here
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
