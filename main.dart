import 'package:flutter/material.dart';
import 'package:languify/screens/language_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Languify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LanguageScreen(language: _language),
    );
  }
}