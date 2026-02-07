import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ln48/app/app_router.dart';
import 'package:ln48/app/game_registry.dart';
import 'package:ln48/l10n/app_localizations.dart';
import 'package:ln48_core/core/ui/widgets/game_tile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final games = ref.watch(gameRegistryProvider);
    final l10n = AppLocalizations.of(context)!;
    final comingCount = (48 - games.length).clamp(0, 48);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeTitle),
        actions: [
          IconButton(
            onPressed: () => goToSettings(context),
            icon: const Icon(Icons.settings),
            tooltip: l10n.settingsTitle,
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          if (index < games.length) {
            final game = games[index];
            return GameTile(
              title: game.title(context),
              description: game.description(context),
              icon: game.icon,
              onTap: () => goToGame(context, game.id),
              isNew: game.isNew,
              newLabel: l10n.badgeNew,
            );
          }

          return GameTile(
            title: l10n.moreGamesTitle,
            description: l10n.moreGamesDescription(comingCount),
            icon: Icons.add_circle_outline,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemCount: games.length + 1,
      ),
    );
  }
}
