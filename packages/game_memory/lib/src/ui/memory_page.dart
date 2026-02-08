import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_memory/l10n/game_memory_localizations.dart';
import 'package:game_memory/src/memory_controller.dart';
import 'package:ln48_core/core/core_providers.dart';
import 'package:ln48_core/core/domain/entities/content_pack.dart';
import 'package:ln48_core/core/ui/widgets/empty_view.dart';
import 'package:ln48_core/core/ui/widgets/error_view.dart';
import 'package:ln48_core/core/ui/widgets/loading_view.dart';

class MemoryPage extends ConsumerStatefulWidget {
  const MemoryPage({super.key});

  @override
  ConsumerState<MemoryPage> createState() => _MemoryPageState();
}

class _MemoryPageState extends ConsumerState<MemoryPage> {
  static const List<int> _tileOptions = [10, 20, 50];
  static const String _scoreStorageKey = 'memory_scores_v1';
  static const double _minTileWidth = 160;
  static const double _maxTileWidth = 280;
  static const double _minTileHeight = 64;
  static const double _maxTileHeight = 120;
  static const double _tileStep = 12;

  int? _selectedTiles;
  bool _autoStarted = false;
  List<_MemoryCard> _cards = [];
  final Set<int> _matched = {};
  final List<int> _open = [];
  bool _busy = false;
  bool _completed = false;
  int _flipCount = 0;
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _ticker;
  int _elapsedMs = 0;
  Map<int, _ScoreBucket> _scores = _defaultScores();
  double _tileWidth = 220;
  double _tileHeight = 84;
  bool _displayTime = false;
  bool _displayFlips = false;

  @override
  void initState() {
    super.initState();
    _loadScores();
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = GameMemoryLocalizations.of(context)!;
    final packAsync = ref.watch(memoryControllerProvider);
    final pack = packAsync.asData?.value;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        actions: [
          if (_displayTime)
            _StatusPill(
              text: '${l10n.memoryTimeLabel} ${_formatDurationMs(_elapsedMs)}',
            ),
          if (_displayTime && _displayFlips) const SizedBox(width: 8),
          if (_displayFlips)
            _StatusPill(text: '${l10n.memoryFlipsLabel} $_flipCount'),
          if (_displayTime || _displayFlips) const SizedBox(width: 8),
          if (_selectedTiles != null)
            IconButton(
              tooltip: l10n.memoryRestart,
              onPressed:
                  pack == null ? null : () => _startGame(_selectedTiles!, pack),
              icon: const Icon(Icons.restart_alt),
            ),
          IconButton(
            tooltip: l10n.memoryInfo,
            onPressed: _showInfo,
            icon: const Icon(Icons.info_outline),
          ),
          IconButton(
            tooltip: l10n.memorySettings,
            onPressed: pack == null ? null : () => _showSettings(pack),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: packAsync.when(
        data: (pack) {
          if (pack.items.isEmpty) {
            return EmptyView(message: l10n.memoryNoCardsFound);
          }
          final availableTiles = pack.items.length * 2;
          if (_selectedTiles == null) {
            if (availableTiles < _tileOptions.first) {
              return EmptyView(message: l10n.memoryNotEnoughWords);
            }
            if (!_autoStarted) {
              _autoStarted = true;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                _startGame(_tileOptions.first, pack);
              });
            }
            return const LoadingView();
          }
          return _BoardView(
            cards: _cards,
            matched: _matched,
            open: _open,
            onTap: _handleTap,
            tileWidth: _tileWidth,
            tileHeight: _tileHeight,
          );
        },
        loading: () => const LoadingView(),
        error: (error, _) => ErrorView(error: error),
      ),
    );
  }

  void _startGame(int tiles, ContentPack pack) {
    final pairs = tiles ~/ 2;
    final cards = _buildCards(pairs, pack);
    setState(() {
      _selectedTiles = tiles;
      _cards = cards;
      _matched.clear();
      _open.clear();
      _busy = false;
      _completed = false;
      _flipCount = 0;
      _stopwatch.reset();
      _elapsedMs = 0;
    });
    _stopTicker();
  }

  void _handleTap(int index) {
    if (_busy ||
        _completed ||
        _matched.contains(index) ||
        _open.contains(index)) {
      return;
    }
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _startTicker();
    }
    setState(() {
      _open.add(index);
      _flipCount += 1;
    });
    if (_open.length < 2) return;

    final first = _open[0];
    final second = _open[1];
    final match = _cards[first].id == _cards[second].id;

    if (match) {
      setState(() {
        _matched.addAll(_open);
        _open.clear();
      });
      if (_matched.length == _cards.length) {
        _finishGame();
      }
      return;
    }

    _busy = true;
    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;
      setState(() {
        _open.clear();
        _busy = false;
      });
    });
  }

  List<_MemoryCard> _buildCards(int countPairs, ContentPack pack) {
    final items = [...pack.items]..shuffle(Random());
    final picked = items.take(countPairs).toList();
    final cards = <_MemoryCard>[];
    for (final item in picked) {
      cards.add(_MemoryCard(id: item.id, text: item.term, isGerman: true));
      cards.add(
        _MemoryCard(id: item.id, text: item.translation, isGerman: false),
      );
    }
    cards.shuffle(Random());
    return cards;
  }

  Future<void> _finishGame() async {
    if (_completed) return;
    _completed = true;
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    }
    _stopTicker();
    final tiles = _selectedTiles;
    if (tiles == null) return;
    final elapsedMs = _stopwatch.elapsedMilliseconds;
    _elapsedMs = elapsedMs;
    final flips = _flipCount;
    final updated = _applyScore(
      _scores,
      tiles: tiles,
      elapsedMs: elapsedMs,
      flips: flips,
    );
    setState(() {
      _scores = updated;
    });
    await _saveScores(updated);
    if (!mounted) return;
    await showDialog<void>(
      context: context,
      builder: (context) {
        final l10n = GameMemoryLocalizations.of(context)!;
        return AlertDialog(
          title: Text(l10n.memoryResultTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_displayTime)
                Text(l10n.memoryResultTime(_formatDurationMs(elapsedMs))),
              if (_displayTime && _displayFlips) const SizedBox(height: 8),
              if (_displayFlips) Text(l10n.memoryResultFlips(flips)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.memoryDialogOk),
            ),
          ],
        );
      },
    );
  }

  Future<void> _loadScores() async {
    final settings = ref.read(settingsRepositoryProvider);
    final raw = await settings.getString(_scoreStorageKey);
    if (!mounted) return;
    if (raw == null || raw.trim().isEmpty) return;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return;
      final loaded = _scoresFromJson(decoded);
      setState(() => _scores = loaded);
    } catch (_) {
      return;
    }
  }

  Future<void> _saveScores(Map<int, _ScoreBucket> scores) async {
    final settings = ref.read(settingsRepositoryProvider);
    final payload = jsonEncode(_scoresToJson(scores));
    await settings.setString(_scoreStorageKey, payload);
  }

  void _showSettings(ContentPack pack) {
    final l10n = GameMemoryLocalizations.of(context)!;
    final availableTiles = pack.items.length * 2;
    final options =
        _tileOptions.where((count) => count <= availableTiles).toList();
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        if (availableTiles < _tileOptions.first || options.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(l10n.memoryNotEnoughWords),
          );
        }
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ListTile(
              title: Text(l10n.memoryBoardSize),
              contentPadding: EdgeInsets.zero,
              trailing: SizedBox(
                width: 210,
                child: Row(
                  children: [
                    for (final count in options) ...[
                      Expanded(
                        child: FilledButton.tonal(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _startGame(count, pack);
                          },
                          child: Text('$count'),
                        ),
                      ),
                      if (count != options.last) const SizedBox(width: 8),
                    ],
                  ],
                ),
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(l10n.memoryTileSize),
              contentPadding: EdgeInsets.zero,
              trailing: StatefulBuilder(
                builder: (context, setSheetState) {
                  final canShrink = _tileWidth > _minTileWidth;
                  final canGrow = _tileWidth < _maxTileWidth;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: canShrink
                            ? () {
                                setState(() {
                                  _tileWidth = (_tileWidth - _tileStep)
                                      .clamp(_minTileWidth, _maxTileWidth);
                                  _tileHeight = (_tileHeight - _tileStep)
                                      .clamp(_minTileHeight, _maxTileHeight);
                                });
                                setSheetState(() {});
                              }
                            : null,
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      IconButton(
                        onPressed: canGrow
                            ? () {
                                setState(() {
                                  _tileWidth = (_tileWidth + _tileStep)
                                      .clamp(_minTileWidth, _maxTileWidth);
                                  _tileHeight = (_tileHeight + _tileStep)
                                      .clamp(_minTileHeight, _maxTileHeight);
                                });
                                setSheetState(() {});
                              }
                            : null,
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Divider(),
            StatefulBuilder(
              builder: (context, setSheetState) {
                return Column(
                  children: [
                    SwitchListTile(
                      value: _displayTime,
                      onChanged: (value) {
                        setState(() {
                          _displayTime = value;
                          if (value &&
                              _stopwatch.isRunning &&
                              _ticker == null) {
                            _startTicker();
                          }
                        });
                        setSheetState(() {});
                      },
                      title: Text(l10n.memoryDisplayTime),
                      contentPadding: EdgeInsets.zero,
                    ),
                    SwitchListTile(
                      value: _displayFlips,
                      onChanged: (value) {
                        setState(() {
                          _displayFlips = value;
                        });
                        setSheetState(() {});
                      },
                      title: Text(l10n.memoryDisplayFlips),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showInfo() {
    final l10n = GameMemoryLocalizations.of(context)!;
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return DefaultTabController(
          length: _tileOptions.length,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      l10n.memoryScoresTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TabBar(
                  tabs: [
                    for (final tiles in _tileOptions)
                      Tab(text: l10n.memoryPairsOption(tiles)),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      for (final tiles in _tileOptions)
                        ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            Text(l10n.memoryScoresTime),
                            _ScoreTable(
                              entries: _scores[tiles]?.entries ?? const [],
                              emptyLabel: l10n.memoryScoresEmpty,
                              mode: _ScoreMode.time,
                            ),
                            const SizedBox(height: 12),
                            Text(l10n.memoryScoresFlips),
                            _ScoreTable(
                              entries: _scores[tiles]?.entries ?? const [],
                              emptyLabel: l10n.memoryScoresEmpty,
                              mode: _ScoreMode.flips,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _startTicker() {
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(milliseconds: 200), (_) {
      if (!mounted) return;
      if (_stopwatch.isRunning) {
        setState(() {
          _elapsedMs = _stopwatch.elapsedMilliseconds;
        });
      }
    });
  }

  void _stopTicker() {
    _ticker?.cancel();
    _ticker = null;
  }
}

class _BoardView extends StatelessWidget {
  const _BoardView({
    required this.cards,
    required this.matched,
    required this.open,
    required this.onTap,
    required this.tileWidth,
    required this.tileHeight,
  });

  final List<_MemoryCard> cards;
  final Set<int> matched;
  final List<int> open;
  final ValueChanged<int> onTap;
  final double tileWidth;
  final double tileHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: tileWidth,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: tileHeight,
            ),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              final isFaceUp = matched.contains(index) || open.contains(index);
              return _MemoryTile(
                card: card,
                isFaceUp: isFaceUp,
                onTap: () => onTap(index),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _MemoryTile extends StatelessWidget {
  const _MemoryTile({
    required this.card,
    required this.isFaceUp,
    required this.onTap,
  });

  final _MemoryCard card;
  final bool isFaceUp;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 0,
        color: isFaceUp ? Colors.white : theme.colorScheme.primary,
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isFaceUp
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      card.text,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium
                          ?.copyWith(color: Colors.black),
                    ),
                  )
                : Icon(
                    Icons.help_outline,
                    color: theme.colorScheme.onPrimary,
                  ),
          ),
        ),
      ),
    );
  }
}

class _MemoryCard {
  const _MemoryCard({
    required this.id,
    required this.text,
    required this.isGerman,
  });

  final String id;
  final String text;
  final bool isGerman;
}

class _ScoreEntry {
  const _ScoreEntry({required this.timeMs, required this.flips});

  final int timeMs;
  final int flips;
}

class _ScoreBucket {
  const _ScoreBucket({required this.entries});

  final List<_ScoreEntry> entries;
}

enum _ScoreMode { time, flips }

Map<int, _ScoreBucket> _defaultScores() {
  return const {
    10: _ScoreBucket(entries: []),
    20: _ScoreBucket(entries: []),
    50: _ScoreBucket(entries: []),
  };
}

Map<int, _ScoreBucket> _scoresFromJson(Map<String, dynamic> json) {
  final scores = Map<int, _ScoreBucket>.from(_defaultScores());
  for (final tiles in _MemoryPageState._tileOptions) {
    final entry = json['$tiles'];
    if (entry is Map<String, dynamic>) {
      final entries = _entryList(entry['entries']);
      scores[tiles] = _ScoreBucket(entries: entries);
    }
  }
  return scores;
}

Map<String, dynamic> _scoresToJson(Map<int, _ScoreBucket> scores) {
  final result = <String, dynamic>{};
  for (final entry in scores.entries) {
    result['${entry.key}'] = {
      'entries': entry.value.entries
          .map((item) => {'timeMs': item.timeMs, 'flips': item.flips})
          .toList(),
    };
  }
  return result;
}

Map<int, _ScoreBucket> _applyScore(
  Map<int, _ScoreBucket> scores, {
  required int tiles,
  required int elapsedMs,
  required int flips,
}) {
  final current = scores[tiles] ?? const _ScoreBucket(entries: []);
  final entry = _ScoreEntry(
    timeMs: elapsedMs,
    flips: flips,
  );
  final entries = _capEntries([...current.entries, entry]);
  return {
    ...scores,
    tiles: _ScoreBucket(entries: entries),
  };
}

List<_ScoreEntry> _entryList(Object? value) {
  if (value is! List) return const [];
  return value.whereType<Map<Object?, Object?>>().map((item) {
    final timeMs = (item['timeMs'] as num?)?.toInt() ?? 0;
    final flips = (item['flips'] as num?)?.toInt() ?? 0;
    return _ScoreEntry(timeMs: timeMs, flips: flips);
  }).toList();
}

List<_ScoreEntry> _capEntries(List<_ScoreEntry> entries) {
  if (entries.length <= 20) return entries;
  return entries.sublist(entries.length - 20);
}

String _formatDurationMs(int milliseconds) {
  final duration = Duration(milliseconds: milliseconds);
  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds % 60;
  return '$minutes:${seconds.toString().padLeft(2, '0')}';
}

class _ScoreTable extends StatelessWidget {
  const _ScoreTable({
    required this.entries,
    required this.emptyLabel,
    required this.mode,
  });

  final List<_ScoreEntry> entries;
  final String emptyLabel;
  final _ScoreMode mode;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(emptyLabel),
      );
    }
    final sorted = [...entries];
    sorted.sort((a, b) {
      final aValue = mode == _ScoreMode.time
          ? (a.timeMs == 0 ? 1 << 30 : a.timeMs)
          : (a.flips == 0 ? 1 << 30 : a.flips);
      final bValue = mode == _ScoreMode.time
          ? (b.timeMs == 0 ? 1 << 30 : b.timeMs)
          : (b.flips == 0 ? 1 << 30 : b.flips);
      return aValue.compareTo(bValue);
    });
    final top = sorted.take(3).toList();
    final rows = List.generate(3, (index) {
      final entry = index < top.length ? top[index] : null;
      final timeText = entry == null || entry.timeMs == 0
          ? '-'
          : _formatDurationMs(entry.timeMs);
      final flipsText =
          entry == null || entry.flips == 0 ? '-' : '${entry.flips}';
      return TableRow(
        children: [
          _TableCell(text: '${index + 1}'),
          _TableCell(text: timeText),
          _TableCell(text: flipsText),
        ],
      );
    });
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          children: [
            const _TableCell(text: '#', isHeader: true),
            _TableCell(
              text: GameMemoryLocalizations.of(context)!.memoryTimeLabel,
              isHeader: true,
            ),
            _TableCell(
              text: GameMemoryLocalizations.of(context)!.memoryFlipsLabel,
              isHeader: true,
            ),
          ],
        ),
        ...rows,
      ],
    );
  }
}

class _TableCell extends StatelessWidget {
  const _TableCell({required this.text, this.isHeader = false});

  final String text;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    final style = isHeader
        ? Theme.of(context).textTheme.labelMedium
        : Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
