import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ln48/app/app_router.dart';
import 'package:ln48/app/app_theme.dart';
import 'package:ln48/app/game_registry.dart';
import 'package:ln48/l10n/app_localizations.dart';
import 'package:ln48_core/core/locale/locale_controller.dart';
import 'package:ln48_core/core/settings/theme_mode_controller.dart';

class Ln48App extends ConsumerWidget {
  const Ln48App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final localeAsync = ref.watch(localeControllerProvider);
    final themeModeAsync = ref.watch(themeModeControllerProvider);
    final themeMode = themeModeAsync.asData?.value ?? AppThemeMode.germanFlag;
    final useGermanFlag = themeMode == AppThemeMode.germanFlag;
    final gameDelegates = ref
        .watch(gameRegistryProvider)
        .expand((game) => game.localizationsDelegates);
    final localizationsDelegates = <LocalizationsDelegate<dynamic>>{
      ...AppLocalizations.localizationsDelegates,
      ...gameDelegates,
    }.toList();

    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: localeAsync.asData?.value,
      theme: useGermanFlag ? appThemeGermanFlag : appThemeDark,
      darkTheme: useGermanFlag ? appThemeGermanFlag : appThemeDark,
      themeMode: themeMode.materialThemeMode,
      routerConfig: router,
    );
  }
}
