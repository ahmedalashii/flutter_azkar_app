// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'screens/about_app_screen.dart';
import 'screens/launch_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const Azkar());
}

class Azkar extends StatelessWidget {
  const Azkar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/launch_screen", // this is an alternative wau of home
      routes: <String, WidgetBuilder>{
        "/launch_screen": (context) => LaunchScreen(),
        "/main_screen": (context) => MainScreen(),
        "/about_app_screen": (context) => AboutAppScreen(),
      },
    );
  }
}
