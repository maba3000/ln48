import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ln48/l10n/app_localizations.dart';

class AttributionsPage extends StatelessWidget {
  const AttributionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final entries = [
      _AttributionEntry(
        title: l10n.attributionsLanguageLearningDecks,
        assetPath: 'assets/attributions/language_learning_decks.md',
      ),
      _AttributionEntry(
        title: l10n.attributionsWordfreq,
        assetPath: 'assets/attributions/wordfreq.md',
      ),
      _AttributionEntry(
        title: l10n.attributionsHowWeAdaptSourceData,
        assetPath: 'assets/attributions/source_data_adaptations.md',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(l10n.settingsDataSources),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle(text: l10n.attributionsSectionDataSources),
            const SizedBox(height: 8),
            for (final entry in entries) ...[
              _EntryButton(entry: entry),
              const SizedBox(height: 12),
            ],
            const SizedBox(height: 8),
            const Divider(height: 1),
            const SizedBox(height: 16),
            _SectionTitle(text: l10n.attributionsSectionLicenses),
            const SizedBox(height: 8),
            _NavigationButton(
              title: l10n.attributionsThirdPartyDependenciesAndLicenses,
              onPressed: () => Navigator.of(context).push(
                PageRouteBuilder<void>(
                  pageBuilder: (_, __, ___) => LicensePage(
                    applicationName: l10n.appTitle,
                  ),
                  transitionsBuilder: (_, animation, __, child) =>
                      FadeTransition(
                    opacity:
                        CurveTween(curve: Curves.easeInOut).animate(animation),
                    child: child,
                  ),
                  transitionDuration: const Duration(milliseconds: 200),
                  reverseTransitionDuration: const Duration(milliseconds: 200),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AttributionEntry {
  const _AttributionEntry({
    required this.title,
    required this.assetPath,
  });

  final String title;
  final String assetPath;
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class _EntryButton extends StatelessWidget {
  const _EntryButton({required this.entry});

  final _AttributionEntry entry;

  @override
  Widget build(BuildContext context) {
    return _NavigationButton(
      title: entry.title,
      onPressed: () => Navigator.of(context).push(
        PageRouteBuilder<void>(
          pageBuilder: (_, __, ___) => _MarkdownPage(entry: entry),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
            child: child,
          ),
          transitionDuration: const Duration(milliseconds: 200),
          reverseTransitionDuration: const Duration(milliseconds: 200),
        ),
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  const _NavigationButton({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(child: Text(title)),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class _MarkdownPage extends StatelessWidget {
  const _MarkdownPage({required this.entry});

  final _AttributionEntry entry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(entry.title),
      ),
      body: FutureBuilder<String>(
        future: rootBundle.loadString(entry.assetPath),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  l10n.errorGeneric,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: SelectableText(
              snapshot.data ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        },
      ),
    );
  }
}
