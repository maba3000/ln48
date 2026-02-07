import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_memory/l10n/game_memory_localizations.dart';

import 'package:game_memory_example/main.dart';

void main() {
  testWidgets('memory game runner loads', (WidgetTester tester) async {
    await tester.pumpWidget(const GameMemoryRunnerApp());
    await tester.pumpAndSettle();

    final BuildContext context = tester.element(find.byType(Scaffold));
    final l10n = GameMemoryLocalizations.of(context)!;
    expect(find.text(l10n.gameMemoryTitle), findsNothing);
  });
}
