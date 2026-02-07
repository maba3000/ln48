import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_memory/game_memory.dart';
import 'package:game_memory/l10n/game_memory_localizations.dart';
import 'package:game_memory/src/ui/memory_page.dart';

void main() {
  test('gameFeature metadata is configured', () {
    expect(gameFeature.id, 'memory');
    expect(gameFeature.icon, Icons.auto_awesome_mosaic);
    expect(gameFeature.isNew, isTrue);
    expect(
      gameFeature.localizationsDelegates,
      contains(GameMemoryLocalizations.delegate),
    );
  });

  testWidgets('gameFeature uses localized strings and builds page',
      (tester) async {
    late BuildContext captured;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: GameMemoryLocalizations.localizationsDelegates,
        supportedLocales: GameMemoryLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
      ),
    );

    expect(gameFeature.title(captured), 'Memory');
    expect(
      gameFeature.description(captured),
      'Flip cards to find matching pairs.',
    );
    expect(gameFeature.buildPage(captured), isA<MemoryPage>());
  });
}
