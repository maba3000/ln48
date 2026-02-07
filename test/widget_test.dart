// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ln48/app/app.dart';
import 'package:ln48/app/home_page.dart';
import 'package:ln48/l10n/app_localizations.dart';

void main() {
  testWidgets('App shows home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: Ln48App()));
    await tester.pumpAndSettle();

    final BuildContext context = tester.element(find.byType(HomePage));
    final l10n = AppLocalizations.of(context)!;
    expect(find.text(l10n.homeTitle), findsOneWidget);
  });
}
