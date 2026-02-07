import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_memory/game_memory.dart';
import 'package:game_memory/l10n/game_memory_localizations.dart';
import 'package:ln48_core/core/core_providers.dart';
import 'package:ln48_core/core/domain/entities/word_item.dart';
import 'package:ln48_core/testing/game_runner_support.dart';

void main() {
  runApp(const GameMemoryRunnerApp());
}

final List<WordItem> _sampleItems = List.generate(120, (index) {
  final number = index + 1;
  final mod = number % 3;
  final article = mod == 0 ? 'das' : (mod == 1 ? 'der' : 'die');
  return WordItem(
    id: 'mock_$number',
    term: '$article Wort $number',
    translation: 'word $number',
    article: article,
    plural: 'die Woerter $number',
  );
});

class GameMemoryRunnerApp extends StatelessWidget {
  const GameMemoryRunnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        contentRepositoryProvider.overrideWithValue(
          SampleContentRepository(_sampleItems, title: 'Mocked'),
        ),
        progressRepositoryProvider.overrideWithValue(NoopProgressRepository()),
        settingsRepositoryProvider
            .overrideWithValue(InMemorySettingsRepository()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GameMemoryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: GameMemoryLocalizations.supportedLocales,
        home: Builder(builder: (context) => gameFeature.buildPage(context)),
      ),
    );
  }
}
