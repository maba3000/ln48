import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ln48_core/core/core_providers.dart';
import 'package:ln48_core/core/locale/locale_keys.dart';
import 'package:ln48_core/core/locale/locale_providers.dart';

class LocaleController extends AsyncNotifier<Locale> {
  @override
  Future<Locale> build() async {
    final settings = ref.watch(settingsRepositoryProvider);
    final storedCode = await settings.getString(LocaleKeys.languageCode);
    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    final resolved = _resolveLocale(storedCode, deviceLocale);
    return resolved;
  }

  Future<void> updateLocale(Locale locale) async {
    final settings = ref.read(settingsRepositoryProvider);
    await settings.setString(LocaleKeys.languageCode, locale.languageCode);
    state = AsyncData(locale);
  }

  Locale _resolveLocale(String? storedCode, Locale deviceLocale) {
    final supported = ref.read(supportedLocalesProvider);
    if (storedCode != null) {
      final match = supported
          .firstWhereOrNull((locale) => locale.languageCode == storedCode);
      if (match != null) return match;
    }

    final deviceMatch = supported.firstWhereOrNull(
      (locale) => locale.languageCode == deviceLocale.languageCode,
    );
    if (deviceMatch != null) return deviceMatch;

    return const Locale('en');
  }
}

final localeControllerProvider =
    AsyncNotifierProvider<LocaleController, Locale>(LocaleController.new);
