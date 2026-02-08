// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Play German 48';

  @override
  String get gameNotFound => 'Game not found';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get errorMissingContent => 'Content is missing for this language.';

  @override
  String get errorInvalidContent => 'Content is corrupted or invalid.';

  @override
  String get errorDatabase => 'Could not save your progress.';

  @override
  String get homeTitle => 'Play German 48';

  @override
  String get badgeNew => 'NEW';

  @override
  String get moreGamesTitle => 'New game every month';

  @override
  String moreGamesDescription(int count) {
    return '$count games remaining.';
  }

  @override
  String get privacyTitle => 'Privacy';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsVersion => 'App version';

  @override
  String get settingsTheme => 'Appearance';

  @override
  String get themeModeDark => 'Dark';

  @override
  String get settingsLevel => 'German level';

  @override
  String get settingsPrivacy => 'Privacy';

  @override
  String get settingsDataSources => 'Licenses';

  @override
  String get settingsLicenses => 'Open source licenses';

  @override
  String get settingsSourceCode => 'Source code';

  @override
  String get settingsLinkCopied => 'Link copied';

  @override
  String get attributionsSectionDataSources => 'Data sources';

  @override
  String get attributionsSectionLicenses => 'Software licenses';

  @override
  String get attributionsLanguageLearningDecks => 'Language-Learning-decks';

  @override
  String get attributionsWordfreq => 'wordfreq';

  @override
  String get attributionsHowWeAdaptSourceData => 'How we adapt source data';

  @override
  String get attributionsThirdPartyDependenciesAndLicenses =>
      'Third-party dependencies and licenses';
}
