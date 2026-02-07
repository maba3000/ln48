import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_memory/l10n/game_memory_localizations.dart';
import 'package:game_memory/src/ui/memory_page.dart';
import 'package:ln48_core/core/content/content_pool_provider.dart';
import 'package:ln48_core/core/domain/entities/content_pack.dart';
import 'package:ln48_core/core/domain/entities/word_item.dart';

void main() {
  testWidgets('MemoryPage starts with 10 tiles when data is available',
      (tester) async {
    const pack = ContentPack(
      language: 'de',
      title: 'Basics',
      items: [
        WordItem(id: '1', term: 'Hund', translation: 'dog'),
        WordItem(id: '2', term: 'Katze', translation: 'cat'),
        WordItem(id: '3', term: 'Maus', translation: 'mouse'),
        WordItem(id: '4', term: 'Vogel', translation: 'bird'),
        WordItem(id: '5', term: 'Fisch', translation: 'fish'),
        WordItem(id: '6', term: 'Pferd', translation: 'horse'),
        WordItem(id: '7', term: 'Kuh', translation: 'cow'),
        WordItem(id: '8', term: 'Schaf', translation: 'sheep'),
        WordItem(id: '9', term: 'Ziege', translation: 'goat'),
        WordItem(id: '10', term: 'Schwein', translation: 'pig'),
        WordItem(id: '11', term: 'Ente', translation: 'duck'),
        WordItem(id: '12', term: 'Gans', translation: 'goose'),
        WordItem(id: '13', term: 'Huhn', translation: 'chicken'),
        WordItem(id: '14', term: 'Biene', translation: 'bee'),
        WordItem(id: '15', term: 'Igel', translation: 'hedgehog'),
        WordItem(id: '16', term: 'Fuchs', translation: 'fox'),
        WordItem(id: '17', term: 'Wolf', translation: 'wolf'),
        WordItem(id: '18', term: 'Baer', translation: 'bear'),
        WordItem(id: '19', term: 'Hirsch', translation: 'deer'),
        WordItem(id: '20', term: 'Eule', translation: 'owl'),
        WordItem(id: '21', term: 'Ameise', translation: 'ant'),
        WordItem(id: '22', term: 'Spinne', translation: 'spider'),
        WordItem(id: '23', term: 'Kaefer', translation: 'beetle'),
        WordItem(id: '24', term: 'Schlange', translation: 'snake'),
        WordItem(id: '25', term: 'Kroete', translation: 'toad'),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          contentPoolProvider.overrideWith(
            (ref) => Future.value(pack),
          ),
        ],
        child: const MaterialApp(
          localizationsDelegates:
              GameMemoryLocalizations.localizationsDelegates,
          supportedLocales: GameMemoryLocalizations.supportedLocales,
          home: MemoryPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Memory'), findsNothing);
    expect(find.byTooltip('Restart'), findsOneWidget);
  });

  testWidgets('MemoryPage toggles display time and flips', (tester) async {
    const pack = ContentPack(
      language: 'de',
      title: 'Basics',
      items: [
        WordItem(id: '1', term: 'Hund', translation: 'dog'),
        WordItem(id: '2', term: 'Katze', translation: 'cat'),
        WordItem(id: '3', term: 'Maus', translation: 'mouse'),
        WordItem(id: '4', term: 'Vogel', translation: 'bird'),
        WordItem(id: '5', term: 'Fisch', translation: 'fish'),
        WordItem(id: '6', term: 'Pferd', translation: 'horse'),
        WordItem(id: '7', term: 'Kuh', translation: 'cow'),
        WordItem(id: '8', term: 'Schaf', translation: 'sheep'),
        WordItem(id: '9', term: 'Ziege', translation: 'goat'),
        WordItem(id: '10', term: 'Schwein', translation: 'pig'),
        WordItem(id: '11', term: 'Ente', translation: 'duck'),
        WordItem(id: '12', term: 'Gans', translation: 'goose'),
        WordItem(id: '13', term: 'Huhn', translation: 'chicken'),
        WordItem(id: '14', term: 'Biene', translation: 'bee'),
        WordItem(id: '15', term: 'Igel', translation: 'hedgehog'),
        WordItem(id: '16', term: 'Fuchs', translation: 'fox'),
        WordItem(id: '17', term: 'Wolf', translation: 'wolf'),
        WordItem(id: '18', term: 'Baer', translation: 'bear'),
        WordItem(id: '19', term: 'Hirsch', translation: 'deer'),
        WordItem(id: '20', term: 'Eule', translation: 'owl'),
        WordItem(id: '21', term: 'Ameise', translation: 'ant'),
        WordItem(id: '22', term: 'Spinne', translation: 'spider'),
        WordItem(id: '23', term: 'Kaefer', translation: 'beetle'),
        WordItem(id: '24', term: 'Schlange', translation: 'snake'),
        WordItem(id: '25', term: 'Kroete', translation: 'toad'),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          contentPoolProvider.overrideWith(
            (ref) => Future.value(pack),
          ),
        ],
        child: const MaterialApp(
          localizationsDelegates:
              GameMemoryLocalizations.localizationsDelegates,
          supportedLocales: GameMemoryLocalizations.supportedLocales,
          home: MemoryPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.textContaining('Time'), findsNothing);
    expect(find.textContaining('Flips'), findsNothing);

    await tester.tap(find.byTooltip('Game settings'));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(SwitchListTile, 'Display time'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(SwitchListTile, 'Display flips'));
    await tester.pumpAndSettle();

    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();

    expect(find.textContaining('Time'), findsOneWidget);
    expect(find.textContaining('Flips'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.help_outline).first);
    await tester.pump();

    expect(find.textContaining('Flips 1'), findsOneWidget);

    await tester.tap(find.byTooltip('Game settings'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(SwitchListTile, 'Display flips'));
    await tester.pumpAndSettle();

    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();

    expect(find.textContaining('Flips'), findsNothing);
  });
}
