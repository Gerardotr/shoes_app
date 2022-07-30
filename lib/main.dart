import 'package:flutter/material.dart';
import 'package:shoes_app/intro_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.amber
      ),
      title: 'Material App',
      home: IntroPage()
    );
  }
}