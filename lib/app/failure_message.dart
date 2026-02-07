import 'package:ln48/l10n/app_localizations.dart';
import 'package:ln48_core/core/domain/failures/app_failure.dart';

String failureMessage(AppLocalizations l10n, Object error) {
  if (error is AppFailure) {
    return error.when(
      assetNotFound: (_) => l10n.errorMissingContent,
      invalidData: (_) => l10n.errorInvalidContent,
      database: (_) => l10n.errorDatabase,
      unknown: (_) => l10n.errorGeneric,
    );
  }
  return l10n.errorGeneric;
}
