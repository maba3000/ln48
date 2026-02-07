import 'package:flutter/material.dart';
import 'package:game_api/game_api.dart';
import 'package:game_map/l10n/game_map_localizations.dart';
import 'package:game_map/src/ui/map_page.dart';

final GameFeature gameFeature = GameFeature(
  id: 'map',
  title: (context) => GameMapLocalizations.of(context)!.gameMapTitle,
  description: (context) =>
      GameMapLocalizations.of(context)!.gameMapDescription,
  icon: Icons.public,
  buildPage: (context) => const MapPage(),
  localizationsDelegates: const [GameMapLocalizations.delegate],
);
