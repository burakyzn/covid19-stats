import 'package:flutter/material.dart';
import 'package:coronavirusstatistics/list_page.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: MainApp()));
}

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : ListPage()
    );
  }
}