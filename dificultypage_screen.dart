import 'package:flutter/material.dart';

class DifficultyPageScreen extends StatelessWidget {
  final String title;
  final List<String> difficulties;
  final Function(String) onDifficultySelected;

  DifficultyPageScreen({
    required this.title,
    required this.difficulties,
    required this.onDifficultySelected,
  });

  Widget _buildDifficultyButton(String difficulty) {
    return ElevatedButton(
      onPressed: () => onDifficultySelected(difficulty),
      child: Text(difficulty),
    );
  }

  Widget _buildDifficultyList() {
    return Column(
      children: difficulties.map((difficulty) => _buildDifficultyButton(difficulty)).toList(),
    );
  }

  Widget difficultyScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: _buildDifficultyList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return difficultyScreen(context);
  }
}
