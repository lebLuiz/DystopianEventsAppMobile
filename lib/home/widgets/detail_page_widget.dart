import 'package:flutter/material.dart';

class DetailPageWidget extends StatefulWidget {
  @override
  _DetailPageWidgetState createState() => _DetailPageWidgetState();
}

class _DetailPageWidgetState extends State<DetailPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Default page'),
      ),
      body: Center(
        child: Text("Welcome to Detail Page!"),
      ),
    );
  }
}