import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_articles/l10n/game_articles_localizations.dart';
import 'package:game_articles/src/articles_controller.dart';
import 'package:ln48_core/core/core_providers.dart';
import 'package:ln48_core/core/domain/entities/content_pack.dart';
import 'package:ln48_core/core/domain/entities/word_item.dart';
import 'package:ln48_core/core/ui/widgets/empty_view.dart';
import 'package:ln48_core/core/ui/widgets/error_view.dart';
import 'package:ln48_core/core/ui/widgets/loading_view.dart';

class ArticlesPage extends ConsumerStatefulWidget {
  const ArticlesPage({super.key});

  @override
  ConsumerState<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends ConsumerState<ArticlesPage> {
  static const String _scoreStorageKey = 'articles_scores_v1';
  static const String _helpMarkdown = '''
# German Articles – Common Gender Patterns (Nominative)

German noun gender often follows **typical patterns**.
These rules are **not 100%**, but they help you make good guesses.

## Masculine — **der**
Usually masculine:

### Typical meanings
- Male people and animals
- Days, months, seasons
- Directions and weather

### Common endings
- **-er** (der Lehrer)
- **-en** (der Garten)
- **-el** (der Apfel)
- **-ling** (der Schmetterling)
- **-ig** (der Honig)

## Feminine — **die**
Usually feminine:

### Typical meanings
- Female people and animals
- Many abstract nouns

### Common endings
- **-e** (die Blume)
- **-heit** (die Freiheit)
- **-keit** (die Möglichkeit)
- **-ung** (die Zeitung)
- **-schaft** (die Freundschaft)
- **-ion** (die Nation)
- **-tät** (die Universität)

## Neuter — **das**
Usually neuter:

### Typical meanings
- Young people and animals
- Infinitives used as nouns

### Common endings
- **-chen** (das Mädchen)
- **-lein** (das Fräulein)
- **-ment** (das Instrument)
- **-um** (das Zentrum)
- **-nis** (das Ergebnis)

## Plural — **die**
Plural nouns:

- **Always use _die_**
- Gender no longer matters

Examples:
- die Männer
- die Frauen
- die Häuser

## Quick Reminder
These are **patterns, not strict rules**.
The safest method is always to learn the **noun with its article**:
> der Tisch · die Tür · das Fenster
''';

  final _rng = Random();
  late List<WordItem> _items;
  WordItem? _current;
  bool _showPlural = false;
  bool? _lastCorrect;
  _AnswerChoice? _lastChoice;
  int _streak = 0;
  bool _displayStreak = false;
  bool _displayPastResults = false;
  WordItem? _lastItem;
  List<int> _bestStreaks = _defaultBestStreaks();

  @override
  void initState() {
    super.initState();
    _loadScores();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = GameArticlesLocalizations.of(context)!;
    final packAsync = ref.watch(articlesControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        actions: [
          if (_displayStreak)
            _StatusPill(text: '${l10n.articlesStreakLabel} $_streak'),
          if (_displayStreak) const SizedBox(width: 8),
          IconButton(
            tooltip: l10n.articlesInfo,
            onPressed: _showInfo,
            icon: const Icon(Icons.info_outline),
          ),
          IconButton(
            tooltip: l10n.articlesHelp,
            onPressed: _showHelp,
            icon: const Icon(Icons.menu_book_outlined),
          ),
          IconButton(
            tooltip: l10n.articlesSettings,
            onPressed: _showSettings,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: packAsync.when(
        data: (pack) {
          final items = _eligibleItems(pack);
          if (items.isEmpty) {
            return EmptyView(message: l10n.articlesNotEnoughWords);
          }
          _items = items;
          if (_current == null || !_items.contains(_current)) {
            _current = _pickRandomItem();
            _showPlural = _rollPlural(_current!);
            _lastCorrect = null;
          }
          final question = _displayQuestion(_current!, _showPlural);
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_displayPastResults && _lastItem != null)
                  _PreviousResultCard(
                    label: l10n.articlesPreviousLabel,
                    question: _lastItem!.term,
                    translation: _lastItem!.translation,
                  ),
                if (_displayPastResults && _lastItem != null)
                  const SizedBox(height: 12),
                Text(
                  l10n.articlesPrompt,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      question,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 260,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: _AnswerButton(
                                label: l10n.articlesOptionDer,
                                onTap: () => _answer(_AnswerChoice.der),
                                isWrong: _lastCorrect == false &&
                                    _lastChoice == _AnswerChoice.der,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _AnswerButton(
                                label: l10n.articlesOptionDie,
                                onTap: () => _answer(_AnswerChoice.die),
                                isWrong: _lastCorrect == false &&
                                    _lastChoice == _AnswerChoice.die,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: _AnswerButton(
                                label: l10n.articlesOptionDas,
                                onTap: () => _answer(_AnswerChoice.das),
                                isWrong: _lastCorrect == false &&
                                    _lastChoice == _AnswerChoice.das,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _AnswerButton(
                                label: l10n.articlesOptionPlural,
                                onTap: () => _answer(_AnswerChoice.plural),
                                isWrong: _lastCorrect == false &&
                                    _lastChoice == _AnswerChoice.plural,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
        loading: () => const LoadingView(),
        error: (error, _) => ErrorView(error: error),
      ),
    );
  }

  List<WordItem> _eligibleItems(ContentPack pack) {
    return pack.items.where((item) => item.article != null).toList();
  }

  void _answer(_AnswerChoice choice) {
    if (_current == null) return;
    final correct = _isCorrect(_current!, _showPlural, choice);
    _lastItem = _current;
    _lastChoice = choice;
    if (correct) {
      setState(() {
        _streak += 1;
        _lastCorrect = null;
        _lastChoice = null;
      });
      _nextQuestion();
    } else {
      final updated = _applyStreak(_bestStreaks, _streak);
      setState(() {
        _streak = 0;
        _lastCorrect = false;
        _bestStreaks = updated;
      });
      _saveScores(updated);
    }
  }

  void _nextQuestion() {
    final next = _pickRandomItem(avoid: _current);
    setState(() {
      _current = next;
      _showPlural = _rollPlural(next);
      _lastCorrect = null;
      _lastChoice = null;
    });
  }

  WordItem _pickRandomItem({WordItem? avoid}) {
    if (_items.length <= 1 || avoid == null) {
      return _items[_rng.nextInt(_items.length)];
    }
    if (_items.length == 2) {
      return _items.first == avoid ? _items.last : _items.first;
    }
    var next = _items[_rng.nextInt(_items.length)];
    var attempts = 0;
    while (next == avoid && attempts < 5) {
      next = _items[_rng.nextInt(_items.length)];
      attempts++;
    }
    if (next == avoid) {
      for (final item in _items) {
        if (item != avoid) {
          return item;
        }
      }
    }
    return next;
  }

  bool _rollPlural(WordItem item) {
    final canShowPlural = item.plural != null && item.plural!.isNotEmpty;
    return canShowPlural && _rng.nextBool();
  }

  bool _isCorrect(WordItem item, bool showPlural, _AnswerChoice choice) {
    if (showPlural) {
      return choice == _AnswerChoice.plural;
    }
    final article = item.article?.toLowerCase().trim();
    return switch (choice) {
      _AnswerChoice.der => article == 'der',
      _AnswerChoice.die => article == 'die',
      _AnswerChoice.das => article == 'das',
      _AnswerChoice.plural => false,
    };
  }

  String _displayQuestion(WordItem item, bool showPlural) {
    if (showPlural && item.plural != null && item.plural!.isNotEmpty) {
      return _stripLeadingArticle(item.plural!);
    }
    return _stripLeadingArticle(item.term);
  }

  String _stripLeadingArticle(String term) {
    final trimmed = term.trim();
    final lower = trimmed.toLowerCase();
    for (final article in ['der ', 'die ', 'das ']) {
      if (lower.startsWith(article)) {
        return trimmed.substring(article.length);
      }
    }
    return trimmed;
  }

  void _showSettings() {
    final l10n = GameArticlesLocalizations.of(context)!;
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            StatefulBuilder(
              builder: (context, setSheetState) {
                return Column(
                  children: [
                    SwitchListTile(
                      value: _displayStreak,
                      onChanged: (value) {
                        setState(() => _displayStreak = value);
                        setSheetState(() {});
                      },
                      title: Text(l10n.articlesDisplayStreak),
                      contentPadding: EdgeInsets.zero,
                    ),
                    SwitchListTile(
                      value: _displayPastResults,
                      onChanged: (value) {
                        setState(() => _displayPastResults = value);
                        setSheetState(() {});
                      },
                      title: Text(l10n.articlesDisplayPastResults),
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
    final l10n = GameArticlesLocalizations.of(context)!;
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              l10n.articlesHighScoresTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            _StreakTable(
              streaks: _bestStreaks,
              emptyLabel: l10n.articlesHighScoresEmpty,
            ),
          ],
        );
      },
    );
  }

  void _showHelp() {
    final l10n = GameArticlesLocalizations.of(context)!;
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) {
        var expanded = false;
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return FractionallySizedBox(
              heightFactor: expanded ? 0.95 : 0.55,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        tooltip: expanded
                            ? l10n.articlesMinimize
                            : l10n.articlesExpand,
                        onPressed: () {
                          setSheetState(() => expanded = !expanded);
                        },
                        icon: Icon(
                          expanded
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Markdown(
                      data: _helpMarkdown,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ],
              ),
            );
          },
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
      setState(() => _bestStreaks = loaded);
    } catch (_) {
      return;
    }
  }

  Future<void> _saveScores(List<int> scores) async {
    final settings = ref.read(settingsRepositoryProvider);
    final payload = jsonEncode({'streaks': scores});
    await settings.setString(_scoreStorageKey, payload);
  }
}

class _AnswerButton extends StatelessWidget {
  const _AnswerButton({
    required this.label,
    required this.onTap,
    this.isWrong = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool isWrong;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final baseStyle = OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
    final style = isWrong
        ? baseStyle.copyWith(
            backgroundColor: WidgetStatePropertyAll(scheme.errorContainer),
            foregroundColor: WidgetStatePropertyAll(scheme.onErrorContainer),
            side: WidgetStatePropertyAll(BorderSide(color: scheme.error)),
          )
        : baseStyle;
    return SizedBox(
      height: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        style: style,
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

enum _AnswerChoice { der, die, das, plural }

class _PreviousResultCard extends StatelessWidget {
  const _PreviousResultCard({
    required this.label,
    required this.question,
    required this.translation,
  });

  final String label;
  final String question;
  final String translation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 4),
            Text(
              '$question — $translation',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
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

class _StreakTable extends StatelessWidget {
  const _StreakTable({
    required this.streaks,
    required this.emptyLabel,
  });

  final List<int> streaks;
  final String emptyLabel;

  @override
  Widget build(BuildContext context) {
    if (streaks.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(emptyLabel),
      );
    }
    final rows = List.generate(3, (index) {
      final value = index < streaks.length ? '${streaks[index]}' : '-';
      return TableRow(
        children: [
          _TableCell(text: '${index + 1}'),
          _TableCell(text: value),
        ],
      );
    });
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
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
              text: GameArticlesLocalizations.of(context)!.articlesStreakLabel,
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

List<int> _defaultBestStreaks() {
  return [];
}

List<int> _scoresFromJson(Map<String, dynamic> json) {
  final values = json['streaks'];
  if (values is! List) return [];
  return values.whereType<num>().map((value) => value.toInt()).toList();
}

List<int> _applyStreak(List<int> current, int streak) {
  if (streak <= 0) return current;
  final updated = [...current, streak]..sort((a, b) => b.compareTo(a));
  if (updated.length <= 3) return updated;
  return updated.sublist(0, 3);
}
