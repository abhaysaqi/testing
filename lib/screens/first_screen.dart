import 'package:flutter/material.dart';
import 'package:newtest/resources/auth_methods.dart';
import 'package:newtest/util/ui_helper.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Start or join a meeting",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image.asset('assets/images/onboarding.jpg'),
              ),
              Ui_helper.Custom_btn(
                text: "Sign In With Gogogle",
                onpressed: () {
                  Auth_methods().Signin_with_Google(context);
                },
                padding: EdgeInsets.all(8.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
