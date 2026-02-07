import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'game_articles_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of GameArticlesLocalizations
/// returned by `GameArticlesLocalizations.of(context)`.
///
/// Applications need to include `GameArticlesLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/game_articles_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: GameArticlesLocalizations.localizationsDelegates,
///   supportedLocales: GameArticlesLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the GameArticlesLocalizations.supportedLocales
/// property.
abstract class GameArticlesLocalizations {
  GameArticlesLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static GameArticlesLocalizations? of(BuildContext context) {
    return Localizations.of<GameArticlesLocalizations>(
        context, GameArticlesLocalizations);
  }

  static const LocalizationsDelegate<GameArticlesLocalizations> delegate =
      _GameArticlesLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @gameArticlesTitle.
  ///
  /// In en, this message translates to:
  /// **'Articles'**
  String get gameArticlesTitle;

  /// No description provided for @gameArticlesDescription.
  ///
  /// In en, this message translates to:
  /// **'Pick the right article for each noun.'**
  String get gameArticlesDescription;

  /// No description provided for @articlesPrompt.
  ///
  /// In en, this message translates to:
  /// **'Choose the correct article or plural form.'**
  String get articlesPrompt;

  /// No description provided for @articlesOptionDer.
  ///
  /// In en, this message translates to:
  /// **'der'**
  String get articlesOptionDer;

  /// No description provided for @articlesOptionDie.
  ///
  /// In en, this message translates to:
  /// **'die'**
  String get articlesOptionDie;

  /// No description provided for @articlesOptionDas.
  ///
  /// In en, this message translates to:
  /// **'das'**
  String get articlesOptionDas;

  /// No description provided for @articlesOptionPlural.
  ///
  /// In en, this message translates to:
  /// **'plural'**
  String get articlesOptionPlural;

  /// No description provided for @articlesCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct!'**
  String get articlesCorrect;

  /// No description provided for @articlesWrong.
  ///
  /// In en, this message translates to:
  /// **'Wrong'**
  String get articlesWrong;

  /// No description provided for @articlesNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get articlesNext;

  /// No description provided for @articlesNotEnoughWords.
  ///
  /// In en, this message translates to:
  /// **'Not enough word pairs to start a game.'**
  String get articlesNotEnoughWords;

  /// No description provided for @articlesSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get articlesSettings;

  /// No description provided for @articlesInfo.
  ///
  /// In en, this message translates to:
  /// **'High scores'**
  String get articlesInfo;

  /// No description provided for @articlesDisplayStreak.
  ///
  /// In en, this message translates to:
  /// **'Display streak'**
  String get articlesDisplayStreak;

  /// No description provided for @articlesHighScoresTitle.
  ///
  /// In en, this message translates to:
  /// **'High scores'**
  String get articlesHighScoresTitle;

  /// No description provided for @articlesHighScoresEmpty.
  ///
  /// In en, this message translates to:
  /// **'No scores yet.'**
  String get articlesHighScoresEmpty;

  /// No description provided for @articlesStreakLabel.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get articlesStreakLabel;

  /// No description provided for @articlesDisplayPastResults.
  ///
  /// In en, this message translates to:
  /// **'Display previous result'**
  String get articlesDisplayPastResults;

  /// No description provided for @articlesPreviousLabel.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get articlesPreviousLabel;

  /// No description provided for @articlesHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get articlesHelp;

  /// No description provided for @articlesHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Article tips'**
  String get articlesHelpTitle;

  /// No description provided for @articlesExpand.
  ///
  /// In en, this message translates to:
  /// **'Expand'**
  String get articlesExpand;

  /// No description provided for @articlesMinimize.
  ///
  /// In en, this message translates to:
  /// **'Minimize'**
  String get articlesMinimize;
}

class _GameArticlesLocalizationsDelegate
    extends LocalizationsDelegate<GameArticlesLocalizations> {
  const _GameArticlesLocalizationsDelegate();

  @override
  Future<GameArticlesLocalizations> load(Locale locale) {
    return SynchronousFuture<GameArticlesLocalizations>(
        lookupGameArticlesLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_GameArticlesLocalizationsDelegate old) => false;
}

GameArticlesLocalizations lookupGameArticlesLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return GameArticlesLocalizationsEn();
  }

  throw FlutterError(
      'GameArticlesLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
