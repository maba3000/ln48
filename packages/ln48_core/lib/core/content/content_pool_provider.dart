import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ln48_core/core/core_providers.dart';
import 'package:ln48_core/core/domain/entities/content_pack.dart';
import 'package:ln48_core/core/locale/locale_controller.dart';
import 'package:ln48_core/core/settings/german_levels_controller.dart';

final contentPoolProvider = FutureProvider<ContentPack>((ref) async {
  final repo = ref.watch(contentRepositoryProvider);
  final locale = await ref.watch(localeControllerProvider.future);
  final levels = await ref.watch(germanLevelsControllerProvider.future);
  return repo.loadLevelPack(locale.languageCode, levels);
});
