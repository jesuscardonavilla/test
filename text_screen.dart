import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _StorySection {
  final String text;
  final List<_StoryOption> options;

  _StorySection({required this.text, required this.options});

  factory _StorySection.fromJson(Map<String, dynamic> json) {
    var optionObjsJson = json['choices'];
    var options = <_StoryOption>[];
    if (optionObjsJson != null) {
      options = List<_StoryOption>.from(optionObjsJson.map((_optionJson) => _StoryOption.fromJson(_optionJson)));
    }
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
      destinationIndex: json['destination'],
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
  late Future<List<_StorySection>> _storySectionsFuture;

  @override
  void initState() {
    super.initState();
    _storySectionsFuture = _loadStorySections();
  }

  Future<List<_StorySection>> _loadStorySections() async {
    String storyJson = await rootBundle.loadString('data/${widget.language.toLowerCase()}/${widget.level.toLowerCase()}/story_1.json');
    List<dynamic> jsonList = json.decode(storyJson)['pages'];
    return jsonList.map((json) => _StorySection.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stories'),
      ),
      body: FutureBuilder(
        future: _storySectionsFuture,
        builder: (BuildContext context, AsyncSnapshot<List<_StorySection>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final storySections = snapshot.data!;
              return ListView.builder(
                itemCount: storySections.length,
                itemBuilder: (BuildContext context, int index) {
                  final section = storySections[index];
                  return ListTile(
                    title: Text(section.text),
                    subtitle: Text(section.options.map((option) => option.text).join(', ')),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error loading story sections: ${snapshot.error}'),
              );
            } else {
              return Center(
                child: Text('No story sections found.'),
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
