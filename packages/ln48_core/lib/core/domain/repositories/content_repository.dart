import 'package:ln48_core/core/domain/entities/content_pack.dart';

abstract class ContentRepository {
  Future<ContentPack> loadLevelPack(String languageCode, Set<String> levels);
}
