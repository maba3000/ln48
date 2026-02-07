import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ln48_core/core/core_providers.dart';
import 'package:ln48_core/core/settings/settings_keys.dart';

enum AppThemeMode {
  system,
  light,
  dark,
  germanFlag,
}

extension AppThemeModeX on AppThemeMode {
  ThemeMode get materialThemeMode {
    return switch (this) {
      AppThemeMode.system => ThemeMode.system,
      AppThemeMode.light => ThemeMode.light,
      AppThemeMode.dark => ThemeMode.dark,
      AppThemeMode.germanFlag => ThemeMode.light,
    };
  }
}

class ThemeModeController extends AsyncNotifier<AppThemeMode> {
  @override
  Future<AppThemeMode> build() async {
    final settings = ref.watch(settingsRepositoryProvider);
    final stored = await settings.getString(SettingsKeys.themeMode);
    return _fromString(stored) ?? AppThemeMode.dark;
  }

  Future<void> setMode(AppThemeMode mode) async {
    final settings = ref.read(settingsRepositoryProvider);
    await settings.setString(SettingsKeys.themeMode, _toString(mode));
    state = AsyncData(mode);
  }

  AppThemeMode? _fromString(String? value) {
    switch (value) {
      case 'system':
        return AppThemeMode.system;
      case 'light':
        return AppThemeMode.light;
      case 'dark':
        return AppThemeMode.dark;
      case 'german_flag':
        return AppThemeMode.germanFlag;
      default:
        return null;
    }
  }

  String _toString(AppThemeMode mode) {
    return switch (mode) {
      AppThemeMode.system => 'system',
      AppThemeMode.light => 'light',
      AppThemeMode.dark => 'dark',
      AppThemeMode.germanFlag => 'german_flag',
    };
  }
}

final themeModeControllerProvider =
    AsyncNotifierProvider<ThemeModeController, AppThemeMode>(
  ThemeModeController.new,
);
