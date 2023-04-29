import 'package:flutter/material.dart';
import 'package:lingofy_again/story_page.dart';

class LevelPage extends StatefulWidget {
  final String language;

  const LevelPage({Key? key, required this.language}) : super(key: key);

  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  final Map<String, Map<String, String>> levelLabels = {
    'English': {
      'Beginner': 'Beginner',
      'Intermediate': 'Intermediate',
      'Advanced': 'Advanced',
    },
    'Italiano': {
      'Beginner': 'Principiante',
      'Intermediate': 'Intermedio',
      'Advanced': 'Avanzato',
    },
    '中文': {
      'Beginner': '初学者',
      'Intermediate': '中级',
      'Advanced': '高级',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.language} Levels')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryPage(
                    language: widget.language,
                    level: 'Beginner',
                  ),
                ),
              );

              // TODO: Add code to navigate to the StoryPage for the beginner level
            },
            child: Text(levelLabels[widget.language]!['Beginner']!),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryPage(
                    language: widget.language,
                    level: 'Intermediate',
                  ),
                ),
              );

              // TODO: Add code to navigate to the StoryPage for the intermediate level
            },
            child: Text(levelLabels[widget.language]!['Intermediate']!),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryPage(
                    language: widget.language,
                    level: 'Advanced',
                  ),
                ),
              );

              // TODO: Add code to navigate to the StoryPage for the advanced level
            },
            child: Text(levelLabels[widget.language]!['Advanced']!)
            ,
          ),
        ],
      ),
    );
  }
}
