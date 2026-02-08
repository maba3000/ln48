import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ln48/app/app_config.dart';
import 'package:ln48/features/settings/attributions_page.dart';
import 'package:ln48/features/settings/privacy_page.dart';
import 'package:ln48/l10n/app_localizations.dart';
import 'package:ln48_core/core/settings/german_levels_controller.dart';
import 'package:ln48_core/core/settings/theme_mode_controller.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final themeModeAsync = ref.watch(themeModeControllerProvider);
    final levelsAsync = ref.watch(germanLevelsControllerProvider);
    final themeMode = themeModeAsync.value ?? AppThemeMode.germanFlag;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(l10n.settingsTitle),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.settingsTheme),
            subtitle: _ThemeModeChips(
              selected: themeMode,
              onSelect: (mode) =>
                  ref.read(themeModeControllerProvider.notifier).setMode(mode),
            ),
          ),
          ListTile(
            title: Text(l10n.settingsLevel),
            subtitle: _LevelChips(
              selected:
                  levelsAsync.value ?? GermanLevelsController.defaultLevels,
              onToggle: (level) => ref
                  .read(germanLevelsControllerProvider.notifier)
                  .toggleLevel(level),
            ),
          ),
          ListTile(
            title: Text(l10n.settingsPrivacy),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              PageRouteBuilder<void>(
                pageBuilder: (_, __, ___) => const PrivacyPage(),
                transitionsBuilder: (_, animation, __, child) => FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                ),
                transitionDuration: const Duration(milliseconds: 200),
                reverseTransitionDuration: const Duration(milliseconds: 200),
              ),
            ),
          ),
          ListTile(
            title: Text(l10n.settingsDataSources),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              PageRouteBuilder<void>(
                pageBuilder: (_, __, ___) => const AttributionsPage(),
                transitionsBuilder: (_, animation, __, child) => FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                ),
                transitionDuration: const Duration(milliseconds: 200),
                reverseTransitionDuration: const Duration(milliseconds: 200),
              ),
            ),
          ),
          ListTile(
            title: Text(l10n.settingsSourceCode),
            subtitle: const Text(AppConfig.repoUrl),
            trailing: const Icon(Icons.copy),
            onTap: () async {
              await Clipboard.setData(
                const ClipboardData(text: AppConfig.repoUrl),
              );
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.settingsLinkCopied)),
              );
            },
          ),
          ListTile(
            title: Text(l10n.settingsVersion),
            subtitle: const _AppVersionText(),
          ),
        ],
      ),
    );
  }
}

class _ThemeModeChips extends StatelessWidget {
  const _ThemeModeChips({
    required this.selected,
    required this.onSelect,
  });

  final AppThemeMode selected;
  final ValueChanged<AppThemeMode> onSelect;

  static const List<AppThemeMode> _modes = [
    AppThemeMode.germanFlag,
    AppThemeMode.dark,
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        for (var i = 0; i < _modes.length; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          Expanded(
            child: ChoiceChip(
              label: Center(
                child: Text(
                  _labelForMode(l10n, _modes[i]),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    // Ensure emoji renders properly
                    fontFamilyFallback: const [
                      'Apple Color Emoji',
                      'Noto Color Emoji',
                    ],
                  ),
                ),
              ),
              showCheckmark: false,
              padding: const EdgeInsets.symmetric(vertical: 10),
              selected: selected == _modes[i],
              onSelected: (_) => onSelect(_modes[i]),
            ),
          ),
        ],
      ],
    );
  }

  String _labelForMode(AppLocalizations l10n, AppThemeMode mode) {
    return switch (mode) {
      AppThemeMode.germanFlag => '🇩🇪',
      AppThemeMode.dark => l10n.themeModeDark,
    };
  }
}

class _LevelChips extends StatelessWidget {
  const _LevelChips({
    required this.selected,
    required this.onToggle,
  });

  final Set<String> selected;
  final ValueChanged<String> onToggle;

  static const List<String> _levels = ['A1', 'A2', 'B1', 'B2'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < _levels.length; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          Expanded(
            child: ChoiceChip(
              label: Center(
                child: Text(
                  _levels[i],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              showCheckmark: false,
              padding: const EdgeInsets.symmetric(vertical: 10),
              selected: selected.contains(_levels[i]),
              onSelected: (_) => onToggle(_levels[i]),
            ),
          ),
        ],
      ],
    );
  }
}

class _AppVersionText extends StatelessWidget {
  const _AppVersionText();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('-');
        }
        final info = snapshot.data!;
        final fullVersion = '${info.version}+${info.buildNumber}';
        return Text(fullVersion);
      },
    );
  }
}
