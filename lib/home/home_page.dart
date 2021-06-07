import 'package:dystopianapp/core/app_colors.dart';
import 'package:dystopianapp/theme_change.dart';
import 'package:flutter/material.dart';

import 'login/login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // void incrementCounter() {
  //   ThemeBuilder.of(context).changeTheme();
  //   setState(() {
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      
      body: LoginPage()
      //BOTÃO PARA MUDAR O TEMA - Dark & Light:
      // bottomNavigationBar: FloatingActionButton(
      //   onPressed: () { 
      //     incrementCounter();
      //    },
      //   child: Icon(Icons.change_history),
      // ),
    );
  }
}