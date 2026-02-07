import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_map/game_map.dart';
import 'package:game_map/l10n/game_map_localizations.dart';
import 'package:game_map/src/ui/map_page.dart';

void main() {
  test('gameFeature metadata is configured', () {
    expect(gameFeature.id, 'map');
    expect(gameFeature.icon, Icons.public);
    expect(
      gameFeature.localizationsDelegates,
      contains(GameMapLocalizations.delegate),
    );
  });

  testWidgets('gameFeature uses localized strings and builds page',
      (tester) async {
    late BuildContext captured;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: GameMapLocalizations.localizationsDelegates,
        supportedLocales: GameMapLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
      ),
    );

    expect(gameFeature.title(captured), 'Map');
    expect(
      gameFeature.description(captured),
      'Explore Germany on a map.',
    );
    expect(gameFeature.buildPage(captured), isA<MapPage>());
  });
}
