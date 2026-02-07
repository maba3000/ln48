import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_articles/game_articles.dart';
import 'package:game_articles/l10n/game_articles_localizations.dart';
import 'package:ln48_core/core/core_providers.dart';
import 'package:ln48_core/core/domain/entities/word_item.dart';
import 'package:ln48_core/testing/game_runner_support.dart';

void main() {
  runApp(const GameArticlesRunnerApp());
}

class GameArticlesRunnerApp extends StatelessWidget {
  const GameArticlesRunnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        contentRepositoryProvider.overrideWithValue(
          SampleContentRepository(const [
            WordItem(
              id: '1',
              term: 'der Tisch',
              translation: 'table',
              article: 'der',
              plural: 'die Tische',
            ),
            WordItem(
              id: '2',
              term: 'die Lampe',
              translation: 'lamp',
              article: 'die',
              plural: 'die Lampen',
            ),
            WordItem(
              id: '3',
              term: 'das Buch',
              translation: 'book',
              article: 'das',
              plural: 'die Buecher',
            ),
          ]),
        ),
        progressRepositoryProvider.overrideWithValue(NoopProgressRepository()),
        settingsRepositoryProvider
            .overrideWithValue(InMemorySettingsRepository()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GameArticlesLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: GameArticlesLocalizations.supportedLocales,
        home: Builder(builder: (context) => gameFeature.buildPage(context)),
      ),
    );
  }
}
