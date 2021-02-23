import 'package:etoken_flutter_app/SplashScreen.dart';
import 'package:flutter/material.dart';
// import 'homeScreen.dart';
import 'SplashScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      );
  }
}


