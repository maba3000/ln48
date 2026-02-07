import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'game_memory_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of GameMemoryLocalizations
/// returned by `GameMemoryLocalizations.of(context)`.
///
/// Applications need to include `GameMemoryLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/game_memory_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: GameMemoryLocalizations.localizationsDelegates,
///   supportedLocales: GameMemoryLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the GameMemoryLocalizations.supportedLocales
/// property.
abstract class GameMemoryLocalizations {
  GameMemoryLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static GameMemoryLocalizations? of(BuildContext context) {
    return Localizations.of<GameMemoryLocalizations>(
        context, GameMemoryLocalizations);
  }

  static const LocalizationsDelegate<GameMemoryLocalizations> delegate =
      _GameMemoryLocalizationsDelegate();

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

  /// No description provided for @gameMemoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Memory'**
  String get gameMemoryTitle;

  /// No description provided for @gameMemoryDescription.
  ///
  /// In en, this message translates to:
  /// **'Flip cards to find matching pairs.'**
  String get gameMemoryDescription;

  /// No description provided for @memoryChangeSize.
  ///
  /// In en, this message translates to:
  /// **'Change size'**
  String get memoryChangeSize;

  /// No description provided for @memorySettings.
  ///
  /// In en, this message translates to:
  /// **'Game settings'**
  String get memorySettings;

  /// No description provided for @memoryInfo.
  ///
  /// In en, this message translates to:
  /// **'Game info'**
  String get memoryInfo;

  /// No description provided for @memoryRestart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get memoryRestart;

  /// No description provided for @memoryBoardSize.
  ///
  /// In en, this message translates to:
  /// **'Game mode (tiles)'**
  String get memoryBoardSize;

  /// No description provided for @memoryTileSize.
  ///
  /// In en, this message translates to:
  /// **'Tile size'**
  String get memoryTileSize;

  /// No description provided for @memoryDisplayTime.
  ///
  /// In en, this message translates to:
  /// **'Display time'**
  String get memoryDisplayTime;

  /// No description provided for @memoryDisplayFlips.
  ///
  /// In en, this message translates to:
  /// **'Display flips'**
  String get memoryDisplayFlips;

  /// No description provided for @memoryTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get memoryTimeLabel;

  /// No description provided for @memoryFlipsLabel.
  ///
  /// In en, this message translates to:
  /// **'Flips'**
  String get memoryFlipsLabel;

  /// No description provided for @memoryPairsOption.
  ///
  /// In en, this message translates to:
  /// **'{count} tiles'**
  String memoryPairsOption(int count);

  /// No description provided for @memoryNotEnoughWords.
  ///
  /// In en, this message translates to:
  /// **'Not enough word pairs to start a game.'**
  String get memoryNotEnoughWords;

  /// No description provided for @memoryAvailablePairs.
  ///
  /// In en, this message translates to:
  /// **'{count} tiles available.'**
  String memoryAvailablePairs(int count);

  /// No description provided for @memoryScoresTitle.
  ///
  /// In en, this message translates to:
  /// **'High scores'**
  String get memoryScoresTitle;

  /// No description provided for @memoryScoresTime.
  ///
  /// In en, this message translates to:
  /// **'Fastest times'**
  String get memoryScoresTime;

  /// No description provided for @memoryScoresFlips.
  ///
  /// In en, this message translates to:
  /// **'Fewest flips'**
  String get memoryScoresFlips;

  /// No description provided for @memoryScoresEmpty.
  ///
  /// In en, this message translates to:
  /// **'No scores yet.'**
  String get memoryScoresEmpty;

  /// No description provided for @memoryResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Round complete'**
  String get memoryResultTitle;

  /// No description provided for @memoryResultTime.
  ///
  /// In en, this message translates to:
  /// **'Time: {time}'**
  String memoryResultTime(String time);

  /// No description provided for @memoryResultFlips.
  ///
  /// In en, this message translates to:
  /// **'Flips: {count}'**
  String memoryResultFlips(int count);

  /// No description provided for @memoryDialogOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get memoryDialogOk;

  /// No description provided for @memoryNoCardsFound.
  ///
  /// In en, this message translates to:
  /// **'No cards found.'**
  String get memoryNoCardsFound;
}

class _GameMemoryLocalizationsDelegate
    extends LocalizationsDelegate<GameMemoryLocalizations> {
  const _GameMemoryLocalizationsDelegate();

  @override
  Future<GameMemoryLocalizations> load(Locale locale) {
    return SynchronousFuture<GameMemoryLocalizations>(
        lookupGameMemoryLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_GameMemoryLocalizationsDelegate old) => false;
}

GameMemoryLocalizations lookupGameMemoryLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return GameMemoryLocalizationsEn();
  }

  throw FlutterError(
      'GameMemoryLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
