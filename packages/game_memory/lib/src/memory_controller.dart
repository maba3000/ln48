import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ln48_core/core/content/content_pool_provider.dart';
import 'package:ln48_core/core/domain/entities/content_pack.dart';

class MemoryController extends AsyncNotifier<ContentPack> {
  @override
  Future<ContentPack> build() async {
    return ref.watch(contentPoolProvider.future);
  }

  Future<void> refreshPack() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }
}

final memoryControllerProvider =
    AsyncNotifierProvider<MemoryController, ContentPack>(MemoryController.new);
