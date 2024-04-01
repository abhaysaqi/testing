import 'package:flutter/material.dart';
import 'package:newtest/resources/auth_methods.dart';
import 'package:newtest/util/border.dart';
import 'package:newtest/util/ui_helper.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _isLoading = false;
  bool tohide = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Ui_helper.custom_textfield(
              controller: emailController,
              to_hide: false,
              text: "Email",
              prefix_icon: Icons.email_rounded),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
                controller: passController,
                obscureText: tohide,
                decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock_rounded),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          tohide = !tohide;
                        });
                      },
                      child: tohide
                          ? Icon(Icons.lock_rounded)
                          : Icon(Icons.lock_open_rounded),
                    ),
                    border: outlineInputBorder)),
          ),
          Ui_helper.Custom_btn(
              text: "Sign In",
              onpressed: () async {
                _toggleLoading();
                await Auth_methods().Signin_with_Emai_Pass(
                    context,
                    emailController.text.toString(),
                    passController.text.toString());
                emailController.clear();
                passController.clear();
                _toggleLoading();
              }),
          SizedBox(
            height: 20,
          ),
          Ui_helper.Custom_btn(
              elevated_style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 57, 206, 65),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              text: "Sign with Google",
              onpressed: () async {
                _toggleLoading();
                Auth_methods().Signin_with_Google(context);
                _toggleLoading();
              }),
          _isLoading ? CircularProgressIndicator() : SizedBox(),
        ],
      ),
    );
  }
}
