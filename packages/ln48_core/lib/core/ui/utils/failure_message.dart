import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef FailureMessageBuilder = String Function(
  BuildContext context,
  Object error,
);

/// Override to provide localized error messages for the host app.
final failureMessageProvider = Provider<FailureMessageBuilder>(
  (_) => (context, error) => error.toString(),
);
