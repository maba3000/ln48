import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_articles/l10n/game_articles_localizations.dart';

import 'package:game_articles_example/main.dart';

void main() {
  testWidgets('articles game runner loads', (WidgetTester tester) async {
    await tester.pumpWidget(const GameArticlesRunnerApp());
    await tester.pumpAndSettle();

    final BuildContext context = tester.element(find.byType(Scaffold));
    final l10n = GameArticlesLocalizations.of(context)!;
    expect(find.text(l10n.articlesPrompt), findsOneWidget);
  });
}
