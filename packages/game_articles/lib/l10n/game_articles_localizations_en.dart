// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'game_articles_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class GameArticlesLocalizationsEn extends GameArticlesLocalizations {
  GameArticlesLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get gameArticlesTitle => 'Articles';

  @override
  String get gameArticlesDescription => 'Pick the right article for each noun.';

  @override
  String get articlesPrompt => 'Choose the correct article or plural form.';

  @override
  String get articlesOptionDer => 'der';

  @override
  String get articlesOptionDie => 'die';

  @override
  String get articlesOptionDas => 'das';

  @override
  String get articlesOptionPlural => 'plural';

  @override
  String get articlesCorrect => 'Correct!';

  @override
  String get articlesWrong => 'Wrong';

  @override
  String get articlesNext => 'Next';

  @override
  String get articlesNotEnoughWords => 'Not enough word pairs to start a game.';

  @override
  String get articlesSettings => 'Settings';

  @override
  String get articlesInfo => 'High scores';

  @override
  String get articlesDisplayStreak => 'Display streak';

  @override
  String get articlesHighScoresTitle => 'High scores';

  @override
  String get articlesHighScoresEmpty => 'No scores yet.';

  @override
  String get articlesStreakLabel => 'Streak';

  @override
  String get articlesDisplayPastResults => 'Display previous result';

  @override
  String get articlesPreviousLabel => 'Previous';

  @override
  String get articlesHelp => 'Help';

  @override
  String get articlesHelpTitle => 'Article tips';

  @override
  String get articlesExpand => 'Expand';

  @override
  String get articlesMinimize => 'Minimize';
}
