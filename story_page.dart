import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class StoryPage extends StatefulWidget {
  final String language;
  final String level;

  StoryPage({required this.language, required this.level});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class Section {
  final String title;
  final String body;

  Section({required this.title, required this.body});

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      title: json['title'],
      body: json['body'],
    );
  }
}

class _StoryPageState extends State<StoryPage> {
  late Future<List<Section>> _storySectionsFuture;

  @override
  void initState() {
    super.initState();
    _storySectionsFuture = _loadStorySections();
  }

  Future<List<Section>> _loadStorySections() async {
    String jsonString = await rootBundle.loadString(
        'assets/data/${widget.language}/${widget.level}/story_1.json');
    List<dynamic> jsonList = json.decode(jsonString);
    List<Section> sections =
    jsonList.map((s) => Section.fromJson(s)).toList();
    return sections;
  }

  Widget _buildSectionWidget(Section section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          section.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(section.body),
        SizedBox(height: 16.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.language} ${widget.level} Story"),
      ),
      body: Center(
        child: FutureBuilder<List<Section>>(
          future: _storySectionsFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Section> sections = snapshot.data!;
              return ListView(
                padding: EdgeInsets.all(16.0),
                children: sections.map((s) => _buildSectionWidget(s)).toList(),
              );
            } else if (snapshot.hasError) {
              return Text("Error loading story sections: ${snapshot.error}");
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
