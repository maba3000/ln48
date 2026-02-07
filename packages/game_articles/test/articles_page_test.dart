import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_articles/l10n/game_articles_localizations.dart';
import 'package:game_articles/src/ui/articles_page.dart';
import 'package:ln48_core/core/content/content_pool_provider.dart';
import 'package:ln48_core/core/domain/entities/content_pack.dart';
import 'package:ln48_core/core/domain/entities/word_item.dart';

void main() {
  testWidgets('ArticlesPage shows prompt when data is available',
      (tester) async {
    const pack = ContentPack(
      language: 'de',
      title: 'Basics',
      items: [
        WordItem(
          id: '1',
          term: 'Hund',
          translation: 'dog',
          article: 'der',
        ),
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
              GameArticlesLocalizations.localizationsDelegates,
          supportedLocales: GameArticlesLocalizations.supportedLocales,
          home: ArticlesPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Articles'), findsNothing);
    expect(
      find.text('Choose the correct article or plural form.'),
      findsOneWidget,
    );
    expect(find.text('der'), findsOneWidget);
    expect(find.text('die'), findsOneWidget);
    expect(find.text('das'), findsOneWidget);
    expect(find.text('plural'), findsOneWidget);
  });
}
