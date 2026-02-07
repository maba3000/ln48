import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_api/game_api.dart';
import 'package:game_articles/game_articles.dart' as articles;
import 'package:game_memory/game_memory.dart' as memory;

final gameRegistryProvider = Provider<List<GameFeature>>((ref) {
  return [
    memory.gameFeature,
    articles.gameFeature,
  ];
});

final gameByIdProvider = Provider.family<GameFeature?, String>((ref, id) {
  final games = ref.watch(gameRegistryProvider);
  for (final game in games) {
    if (game.id == id) return game;
  }
  return null;
});
