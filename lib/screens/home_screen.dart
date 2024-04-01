import 'package:flutter/material.dart';
import 'package:newtest/resources/auth_methods.dart';
// import 'package:newtest/util/home_meeting_button.dart';
import 'package:newtest/screens/meeting_history_screen.dart';
import 'package:newtest/screens/meeting_screen.dart';
import 'package:newtest/util/colors.dart';
import 'package:newtest/util/ui_helper.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  int _page = 0;
  onpage_changed(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    Meeting_screen(),
    const Meeting_history(),
    Text("Contacts"),
    Ui_helper.Custom_btn(
        text: "Log-Out",
        onpressed: () {
          Auth_methods().Sign_out();
        })
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Meet & Chat"),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footer_color,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onpage_changed,
        currentIndex: _page,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank_rounded), label: "Meet & Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock_rounded), label: "Meetings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: "Contacts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded), label: "Settings"),
        ],
      ),
    );
  }
}
