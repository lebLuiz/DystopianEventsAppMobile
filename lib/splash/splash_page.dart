import 'package:dystopianapp/core/app_colors.dart';
import 'package:dystopianapp/core/app_gradients.dart';
import 'package:dystopianapp/core/app_images.dart';
import 'package:dystopianapp/home/home_page.dart';
import 'package:dystopianapp/home/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())));
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: AppGradients.linear
        // ),
        decoration: BoxDecoration(
          color: AppColors.myDark
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(AppImages.islogo),
          ),
        ),
      ),
    );
  }
}