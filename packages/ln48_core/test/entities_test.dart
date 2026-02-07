import 'package:flutter_test/flutter_test.dart';
import 'package:ln48_core/core/domain/entities/content_pack.dart';
import 'package:ln48_core/core/domain/entities/word_item.dart';

void main() {
  test('WordItem copyWith preserves data', () {
    const item = WordItem(
      id: '1',
      term: 'Hund',
      translation: 'dog',
      article: 'der',
      plural: 'Hunde',
    );

    final updated = item.copyWith(translation: 'hound');

    expect(updated.id, item.id);
    expect(updated.term, item.term);
    expect(updated.article, item.article);
    expect(updated.plural, item.plural);
    expect(updated.translation, 'hound');
  });

  test('ContentPack holds items', () {
    const item = WordItem(
      id: '2',
      term: 'Katze',
      translation: 'cat',
    );
    const pack = ContentPack(
      language: 'de',
      title: 'Basics',
      items: [item],
    );

    expect(pack.language, 'de');
    expect(pack.items, hasLength(1));
    expect(pack.items.single.translation, 'cat');
  });
}
