import 'package:flutter/material.dart';

class BodyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // This size provide us total height and width of our screen
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget> [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/laptop.png',
              width: size.width * 0.3,
            ),
          ),
        ],
      ),
    );
  }
}