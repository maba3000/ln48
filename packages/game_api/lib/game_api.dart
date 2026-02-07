import 'package:flutter/material.dart';

typedef GameStringBuilder = String Function(BuildContext context);

class GameFeature {
  const GameFeature({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.buildPage,
    this.isNew = false,
    this.localizationsDelegates = const <LocalizationsDelegate<dynamic>>[],
  });

  final String id;
  final GameStringBuilder title;
  final GameStringBuilder description;
  final IconData icon;
  final WidgetBuilder buildPage;
  final bool isNew;
  final List<LocalizationsDelegate<dynamic>> localizationsDelegates;
}
