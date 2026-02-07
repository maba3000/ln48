import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ln48/app/app.dart';
import 'package:ln48/app/failure_message.dart';
import 'package:ln48/l10n/app_localizations.dart';
import 'package:ln48_core/core/locale/locale_providers.dart';
import 'package:ln48_core/core/ui/utils/failure_message.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      overrides: [
        supportedLocalesProvider
            .overrideWithValue(AppLocalizations.supportedLocales),
        failureMessageProvider.overrideWith(
          (_) => (context, error) {
            final l10n = AppLocalizations.of(context)!;
            return failureMessage(l10n, error);
          },
        ),
      ],
      child: const Ln48App(),
    ),
  );
}
