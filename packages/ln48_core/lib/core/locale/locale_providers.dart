import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Override to provide the supported locales for the host app.
final supportedLocalesProvider = Provider<List<Locale>>(
  (_) => const [Locale('en')],
);
