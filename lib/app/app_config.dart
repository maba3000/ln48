class AppConfig {
  const AppConfig._();

  // Override with: --dart-define=LN48_REPO_URL=https://example.com
  static const String repoUrl = String.fromEnvironment(
    'LN48_REPO_URL',
    defaultValue: 'https://github.com/maba3000/ln48',
  );
}
