import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ln48_core/core/content/content_pool_provider.dart';
import 'package:ln48_core/core/domain/entities/content_pack.dart';

class ArticlesController extends AsyncNotifier<ContentPack> {
  @override
  Future<ContentPack> build() async {
    return ref.watch(contentPoolProvider.future);
  }
}

final articlesControllerProvider =
    AsyncNotifierProvider<ArticlesController, ContentPack>(
  ArticlesController.new,
);
