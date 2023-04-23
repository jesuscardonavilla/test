import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Translations {
  final Locale locale;

  Translations(this.locale);

  static Translations? of(BuildContext context) {
    return Localizations.of<dynamic>(context, Translations);
  }

  static Map<String, Map<String, String>> _translations = {
    'en': {
      'Beginner': 'Beginner',
      'Intermediate': 'Intermediate',
      'Advanced': 'Advanced',
    },
    'es': {
      'Beginner': 'Principiante',
      'Intermediate': 'Intermedio',
      'Advanced': 'Avanzado',
    },
    'fr': {
      'Beginner': 'Débutant',
      'Intermediate': 'Intermédiaire',
      'Advanced': 'Avancé',
    },
    'de': {
      'Beginner': 'Anfänger',
      'Intermediate': 'Mittelstufe',
      'Advanced': 'Fortgeschritten',
    },
    'zh': {
      'Beginner': '初学者',
      'Intermediate': '中级',
      'Advanced': '高级',
    },
    'ja': {
      'Beginner': '初心者',
      'Intermediate': '中級者',
      'Advanced': '上級者',
    },
    'ru': {
      'Beginner': 'Начинающий',
      'Intermediate': 'Средний',
      'Advanced': 'Продвинутый',
    },
    'ko': {
      'Beginner': '초보자',
      'Intermediate': '중급',
      'Advanced': '고급',
    },
  };

  String? translate(BuildContext context, String key) {
    final locale = Localizations.localeOf(context);
    return _translations[locale.languageCode]?.containsKey(key) == true
        ? _translations[locale.languageCode]![key]
        : key;
  }
}