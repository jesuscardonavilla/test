import 'package:flutter/material.dart';
import 'package:languify/screens/dificultypage_screen.dart';
import 'package:languify/screens/translations.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key, required String language}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = '';

  void _handleLanguageChange(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a language'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _handleLanguageChange('English');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DifficultyScreen(
                      language: 'English',
                    ),
                  ),
                );
              },
              child: Text('English'),
            ),
            ElevatedButton(
              onPressed: () {
                _handleLanguageChange('Español');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DifficultyScreen(
                      language: 'Español',
                    ),
                  ),
                );
              },
              child: Text('Español'),
            ),
            ElevatedButton(
              onPressed: () {
                _handleLanguageChange('Français');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DifficultyScreen(
                      language: 'Français',
                    ),
                  ),
                );
              },
              child: Text('Français'),
            ),
            ElevatedButton(
              onPressed: () {
                _handleLanguageChange('Deutsch');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DifficultyScreen(
                      language: 'Deutsch',
                    ),
                  ),
                );
              },
              child: Text('Deutsch'),
            ),
            ElevatedButton(
              onPressed: () {
                _handleLanguageChange('中文');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DifficultyScreen(
                      language: '中文',
                    ),
                  ),
                );
              },
              child: Text('中文'),
            ),
            ElevatedButton(
              onPressed: () {
                _handleLanguageChange('日本語');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DifficultyScreen(
                      language: '日本語',
                    ),
                  ),
                );
              },
              child: Text('日本語'),
            ),
            ElevatedButton(
              onPressed: () {
                _handleLanguageChange('русский');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DifficultyScreen(
                      language: 'русский',
                    ),
                  ),
                );
              },
              child: Text('русский'),
            ),
            ElevatedButton(
              onPressed: () {
                _handleLanguageChange('한국어');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DifficultyScreen(
                      language: '한국어',
                    ),
                  ),
                );
              },
              child: Text('한국어'),
            ),
          ],
        ),
      ),
    );
  }
}

