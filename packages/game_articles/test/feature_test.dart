import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_articles/game_articles.dart';
import 'package:game_articles/l10n/game_articles_localizations.dart';
import 'package:game_articles/src/ui/articles_page.dart';

void main() {
  test('gameFeature metadata is configured', () {
    expect(gameFeature.id, 'articles');
    expect(gameFeature.icon, Icons.article);
    expect(gameFeature.isNew, isTrue);
    expect(
      gameFeature.localizationsDelegates,
      contains(GameArticlesLocalizations.delegate),
    );
  });

  testWidgets('gameFeature uses localized strings and builds page',
      (tester) async {
    late BuildContext captured;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates:
            GameArticlesLocalizations.localizationsDelegates,
        supportedLocales: GameArticlesLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
      ),
    );

    expect(gameFeature.title(captured), 'Articles');
    expect(
      gameFeature.description(captured),
      'Pick the right article for each noun.',
    );
    expect(gameFeature.buildPage(captured), isA<ArticlesPage>());
  });
}
