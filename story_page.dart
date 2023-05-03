import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Story {
  final List<Section> sections;

  Story(this.sections);

  factory Story.fromJson(String jsonStr) {
    try {
      final parsedJson = json.decode(jsonStr);
      final sections = parsedJson['sections']
          .map<Section>((json) => Section.fromJson(json))
          .toList();
      return Story(sections);
    } catch (e) {
      throw Exception('Failed to load story sections: $e');
    }
  }

  static Future<Story> load(String language, String level) async {
    final storyJson = await rootBundle
        .loadString('data/$language/$level/story_1.json')
        .catchError((error) {
      throw Exception('Failed to load story sections: $error');
    });

    return Story.fromJson(storyJson);
  }
}

class Section {
  final String title;
  final String body;

  Section({
    required this.title,
    required this.body,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      title: json['title'],
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
  late Future<List<Section>> _storySectionsFuture;

  @override
  void initState() {
    super.initState();
    _storySectionsFuture = _loadStorySections(widget.language, widget.level);
  }

  Future<List<Section>> _loadStorySections(String language, String level) async {
    String jsonString =
    await rootBundle.loadString('assets/data/$language/$level/story_1.json');
    List<dynamic> jsonMap = json.decode(jsonString);
    List<Section> sections =
    jsonMap.map((s) => Section.fromJson(s)).toList();
    return sections;
  }

  Widget _buildSectionWidget(Section section) {
    return Column(
      children: [
        Text(
          section.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(height: 16),
        Text(
          section.body,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 32),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _storySectionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading story sections: ${snapshot.error}'),
            );
          } else {
            List<Section> storySections = snapshot.data as List<Section>;
            return ListView(
              padding: EdgeInsets.all(16),
              children: List<Widget>.from(
                storySections?.map((s) => _buildSectionWidget(s)) ?? [],
              ),
            );
          }
        },
      ),
    );
  }
}


class _StorySection {
  final String title;
  final String body;

  _StorySection({required this.title, required this.body});

  factory _StorySection.fromJson(Map<String, dynamic> json) {
    return _StorySection(
      title: json['title'],
      body: json['body'],
    );
  }

  String get getTitle => title;
  String get getBody => body;
}

