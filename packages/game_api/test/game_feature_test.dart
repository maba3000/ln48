import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_api/game_api.dart';

void main() {
  test('GameFeature sets fields and default flags', () {
    final feature = GameFeature(
      id: 'demo',
      title: (_) => 'Title',
      description: (_) => 'Description',
      icon: Icons.ac_unit,
      buildPage: (_) => const SizedBox(),
    );

    expect(feature.id, 'demo');
    expect(feature.title(const _FakeBuildContext()), 'Title');
    expect(feature.description(const _FakeBuildContext()), 'Description');
    expect(feature.icon, Icons.ac_unit);
    expect(feature.isNew, isFalse);
    expect(feature.localizationsDelegates, isEmpty);
  });
}

class _FakeBuildContext implements BuildContext {
  const _FakeBuildContext();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
