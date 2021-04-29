import 'package:afterparty/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dystopian Events",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}