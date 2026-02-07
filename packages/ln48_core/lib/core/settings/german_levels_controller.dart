import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ln48_core/core/core_providers.dart';
import 'package:ln48_core/core/settings/settings_keys.dart';

class GermanLevelsController extends AsyncNotifier<Set<String>> {
  static const Set<String> defaultLevels = {'A1'};
  static const Set<String> allowedLevels = {'A1', 'A2', 'B1', 'B2'};

  @override
  Future<Set<String>> build() async {
    final settings = ref.watch(settingsRepositoryProvider);
    final stored = await settings.getString(SettingsKeys.germanLevels);
    if (stored == null || stored.trim().isEmpty) {
      return defaultLevels;
    }
    final levels = stored
        .split(',')
        .map((value) => value.trim())
        .map((value) => value.toUpperCase())
        .where((value) => allowedLevels.contains(value))
        .toSet();
    return levels.isEmpty ? defaultLevels : levels;
  }

  Future<void> toggleLevel(String level) async {
    if (!allowedLevels.contains(level)) return;
    final current = state.value ?? defaultLevels;
    final next = {...current};
    if (next.contains(level)) {
      if (next.length == 1) return;
      next.remove(level);
    } else {
      next.add(level);
    }
    await _persist(next);
    state = AsyncData(next);
  }

  Future<void> setLevels(Set<String> levels) async {
    final sanitized = levels
        .map((level) => level.toUpperCase())
        .where(allowedLevels.contains)
        .toSet();
    if (sanitized.isEmpty) return;
    await _persist(sanitized);
    state = AsyncData(sanitized);
  }

  Future<void> _persist(Set<String> levels) async {
    final settings = ref.read(settingsRepositoryProvider);
    final stored = levels.join(',');
    await settings.setString(SettingsKeys.germanLevels, stored);
  }
}

final germanLevelsControllerProvider =
    AsyncNotifierProvider<GermanLevelsController, Set<String>>(
  GermanLevelsController.new,
);
