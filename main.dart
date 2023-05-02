import 'package:flutter/material.dart';

import 'level_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Short Stories',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Short Stories')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LevelPage(language: 'English'),
                ),
              );
              // TODO: Add code to navigate to the LevelPage for English
            },
            child: Text('English'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LevelPage(language: 'Italiano'),
                ),
              );

              // TODO: Add code to navigate to the LevelPage for Italiano
            },
            child: Text('Italiano'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LevelPage(language: '中文'),
                ),
              );
              // TODO: Add code to navigate to the LevelPage for 中文
            },
            child: Text('中文'),
          ),
        ],
      ),
    );
      // TODO: Add your widget tree for the HomePage here
  }
}


