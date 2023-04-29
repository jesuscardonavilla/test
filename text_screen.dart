import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

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
  late Future<List<Story>> _storiesFuture;

  @override
  void initState() {
    super.initState();
    _storiesFuture = _loadStories();
  }

  Future<List<Story>> _loadStories() async {
    String path = 'data/${widget.language}/${widget.level}/story_1.json';

    String data = await rootBundle.loadString(path);
    List<dynamic> jsonList = json.decode(data);
    List<Story> stories = jsonList.map((json) => Story.fromJson(json)).toList();
    return stories;
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
  final String body;

  Story({required this.title, required this.body});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      title: json['title'],
      body: json['body'],
    );
  }
}
