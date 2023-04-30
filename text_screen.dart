import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _StorySection {
  final String text;
  final List<_StoryOption> options;

  _StorySection({required this.text, required this.options});

  factory _StorySection.fromJson(Map<String, dynamic> json) {
    var optionObjsJson = json['options'] as List<dynamic>;
    var options = optionObjsJson.map((_optionJson) => _StoryOption.fromJson(_optionJson)).toList();
    return _StorySection(
      text: json['text'],
      options: options,
    );
  }
}

class _StoryOption {
  final String text;
  final int destinationIndex;

  _StoryOption({required this.text, required this.destinationIndex});

  factory _StoryOption.fromJson(Map<String, dynamic> json) {
    return _StoryOption(
      text: json['text'],
      destinationIndex: json['destinationIndex'],
    );
  }
}

class StoryPage extends StatefulWidget {
  final String language;
  final String level;

  const StoryPage({
    Key? key,
    required this.language,
    required this.level,
  }) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  Future<List<Story>> _storiesFuture = Future<List<Story>>.value([]);

  Future<List<Story>> _loadStories() async {
    String storyJson = await DefaultAssetBundle.of(context).loadString("data/english/beginner/story_1.json");
    List<dynamic> jsonList = json.decode(storyJson);
    return jsonList.map((json) => Story.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    _storiesFuture = _loadStories();
  }

  Future<Story> loadStoryData() async {
    String data = await rootBundle.loadString('data/english/beginner/story_1.json');
    Map<String, dynamic> jsonMap = json.decode(data);
    Story story = Story.fromJson(jsonMap);
    return story;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stories'),
      ),
      body: FutureBuilder(
        future: _storiesFuture,
        builder: (BuildContext context, AsyncSnapshot<List<Story>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final stories = snapshot.data!;
              return ListView.builder(
                itemCount: stories.length,
                itemBuilder: (BuildContext context, int index) {
                  final story = stories[index];
                  return ListTile(
                    title: Text(story.title),
                    subtitle: Text(story.body),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error loading stories: ${snapshot.error}'),
              );
            } else {
              return Center(
                child: Text('No stories found.'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class Story {
  final String title;
  final String author;
  final String body;

  Story({required this.title, required this.author, required this.body});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      title: json['title'],
      author: json['author'],
      body: json['body'],
    );
  }
}


class Choice {
  final String text;
  final String destination;

  Choice({required this.text, required this.destination});



  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      text: json['text'],
      destination: json['destination'],
    );
  }
}


Future<Story> _loadStory(String path) async {
  String data = await rootBundle.loadString(path);
  Map<String, dynamic> jsonMap = json.decode(data);
  Story story = Story.fromJson(jsonMap);
  return story;
}

