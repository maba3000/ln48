import 'package:flutter/material.dart';
import 'package:game_api/game_api.dart';
import 'package:game_articles/l10n/game_articles_localizations.dart';

import 'package:game_articles/src/ui/articles_page.dart';

final gameFeature = GameFeature(
  id: 'articles',
  title: (context) => GameArticlesLocalizations.of(context)!.gameArticlesTitle,
  description: (context) =>
      GameArticlesLocalizations.of(context)!.gameArticlesDescription,
  icon: Icons.article,
  buildPage: (context) => const ArticlesPage(),
  isNew: true,
  localizationsDelegates: const [GameArticlesLocalizations.delegate],
);
