import 'package:dystopianapp/home/widgets/home_model_widget.dart';
import 'package:dystopianapp/splash/splash_page.dart';
import 'package:dystopianapp/theme_change.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeModelWidget(),
      child: ThemeBuilder(
        builder: (context, _brightness) {
          return MaterialApp(
            title: "Dystopian Events",
            theme: ThemeData(
              primarySwatch: Colors.purple,
              brightness: _brightness,
            ),
            debugShowCheckedModeBanner: false,
            home: SplashPage(),
          );
        }, defaultBrightness: Brightness.dark,
      ),
    );
    
  }
}