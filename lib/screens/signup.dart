import 'package:flutter/material.dart';
import 'package:newtest/resources/auth_methods.dart';
import 'package:newtest/util/border.dart';
import 'package:newtest/util/ui_helper.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
      appBar: AppBar(
        title: Text("Signup"),
        centerTitle: true,
      ),
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
              text: "Sign Up",
              onpressed: () async {
                _toggleLoading();
                await Auth_methods().Signup_with_Emai_Pass(
                    context,
                    emailController.text.toString(),
                    passController.text.toString());
                _toggleLoading();
              }),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Have an Already Account",
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signin');
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue.shade700),
                  )),
            ],
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
              await Auth_methods().Signin_with_Google(context);
              _toggleLoading();
            },
          ),
          _isLoading ? CircularProgressIndicator() : SizedBox(),
        ],
      ),
    );
  }
}
