// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'game_memory_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class GameMemoryLocalizationsEn extends GameMemoryLocalizations {
  GameMemoryLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get gameMemoryTitle => 'Memory';

  @override
  String get gameMemoryDescription => 'Flip cards to find matching pairs.';

  @override
  String get memoryChangeSize => 'Change size';

  @override
  String get memorySettings => 'Game settings';

  @override
  String get memoryInfo => 'Game info';

  @override
  String get memoryRestart => 'Restart';

  @override
  String get memoryBoardSize => 'Game mode (tiles)';

  @override
  String get memoryTileSize => 'Tile size';

  @override
  String get memoryDisplayTime => 'Display time';

  @override
  String get memoryDisplayFlips => 'Display flips';

  @override
  String get memoryTimeLabel => 'Time';

  @override
  String get memoryFlipsLabel => 'Flips';

  @override
  String memoryPairsOption(int count) {
    return '$count tiles';
  }

  @override
  String get memoryNotEnoughWords => 'Not enough word pairs to start a game.';

  @override
  String memoryAvailablePairs(int count) {
    return '$count tiles available.';
  }

  @override
  String get memoryScoresTitle => 'High scores';

  @override
  String get memoryScoresTime => 'Fastest times';

  @override
  String get memoryScoresFlips => 'Fewest flips';

  @override
  String get memoryScoresEmpty => 'No scores yet.';

  @override
  String get memoryResultTitle => 'Round complete';

  @override
  String memoryResultTime(String time) {
    return 'Time: $time';
  }

  @override
  String memoryResultFlips(int count) {
    return 'Flips: $count';
  }

  @override
  String get memoryDialogOk => 'OK';

  @override
  String get memoryNoCardsFound => 'No cards found.';
}
