import 'package:flutter_test/flutter_test.dart';

import 'package:ln48_core/core/data/datasources/content_local_datasource.dart';
import 'package:ln48_core/core/data/repositories_impl/content_repository_impl.dart';

class _FakeContentLocalDatasource extends ContentLocalDatasource {
  _FakeContentLocalDatasource(this.entries);

  final List<Map<String, dynamic>> entries;
  int callCount = 0;

  @override
  Future<List<Map<String, dynamic>>> loadRawList(String assetPath) async {
    callCount += 1;
    return entries;
  }
}

void main() {
  test('ContentRepositoryImpl caches content packs', () async {
    final entries = [
      {
        'word': 'hallo',
        'english_translation': 'hello',
      },
    ];
    final datasource = _FakeContentLocalDatasource(entries);
    final repo = ContentRepositoryImpl(datasource);

    final first = await repo.loadLevelPack('en', {'A1'});
    final second = await repo.loadLevelPack('en', {'A1'});

    expect(first, second);
    expect(datasource.callCount, 1);
  });
}
