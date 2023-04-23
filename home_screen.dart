import 'package:flutter/material.dart';
import 'dificultypage_screen.dart';
import 'language_screen.dart';
import 'text_screen.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedLanguage = 'en';

  void _selectLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Languify'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DifficultyScreen(
                      language: _selectedLanguage,
                    ),
                  ),
                );
              },
              child: Text('Select difficulty'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Select a language'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('English'),
              onTap: () => _selectLanguage('en'),
              selected: _selectedLanguage == 'en',
            ),
            ListTile(
              title: Text('Español'),
              onTap: () => _selectLanguage('es'),
              selected: _selectedLanguage == 'es',
            ),
            ListTile(
              title: Text('Français'),
              onTap: () => _selectLanguage('fr'),
              selected: _selectedLanguage == 'fr',
            ),
            ListTile(
              title: Text('Deutsch'),
              onTap: () => _selectLanguage('de'),
              selected: _selectedLanguage == 'de',
            ),
            ListTile(
              title: Text('中文'),
              onTap: () => _selectLanguage('zh'),
              selected: _selectedLanguage == 'zh',
            ),
            ListTile(
              title: Text('日本語'),
              onTap: () => _selectLanguage('ja'),
              selected: _selectedLanguage == 'ja',
            ),
            ListTile(
              title: Text('Русский'),
              onTap: () => _selectLanguage('ru'),
              selected: _selectedLanguage == 'ru',
            ),
            ListTile(
              title: Text('한국어'),
              onTap: () => _selectLanguage('ko'),
              selected: _selectedLanguage == 'ko',
            ),
          ],
        ),
      ),
    );
  }
}