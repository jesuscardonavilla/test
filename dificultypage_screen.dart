import 'package:flutter/material.dart';
import 'package:languify/screens/translations.dart';

class DifficultyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Translations.of(context)?.translate('chooseDifficulty') ?? '',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(
              Translations.of(context)?.translate('beginnerDifficulty') ?? '',
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              Translations.of(context)?.translate('intermediateDifficulty') ?? '',
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              Translations.of(context)?.translate('advancedDifficulty') ??'',
            ),
          ),
        ],
      ),
    );
  }
}
