import 'package:flutter/material.dart';
import 'package:game_api/game_api.dart';
import 'package:game_memory/l10n/game_memory_localizations.dart';

import 'package:game_memory/src/ui/memory_page.dart';

final gameFeature = GameFeature(
  id: 'memory',
  title: (context) => GameMemoryLocalizations.of(context)!.gameMemoryTitle,
  description: (context) =>
      GameMemoryLocalizations.of(context)!.gameMemoryDescription,
  icon: Icons.auto_awesome_mosaic,
  buildPage: (context) => const MemoryPage(),
  isNew: true,
  localizationsDelegates: const [GameMemoryLocalizations.delegate],
);
