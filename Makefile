.PHONY: run pubget format l10n build_runner ci

# Run the app locally in Chrome.
run:
	flutter run -d chrome --profile

# Fetch dependencies for root and all packages.
pubget:
	flutter pub get
	for p in packages/*; do \
		if [ -f "$$p/pubspec.yaml" ]; then (cd "$$p" && flutter pub get); fi; \
	done

# Auto-fix formatting. Run before committing.
format:
	dart format .

# Regenerate localization files. Run after editing .arb files.
l10n:
	flutter gen-l10n
	for p in packages/*; do \
		if [ -f "$$p/l10n.yaml" ]; then (cd "$$p" && flutter gen-l10n); fi; \
	done

# Regenerate code (Drift tables, Freezed classes, GoRouter routes).
# Run after changing files with @freezed, @DriftDatabase, @TypedGoRoute, etc.
build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs
	(cd packages/ln48_core && flutter pub run build_runner build --delete-conflicting-outputs)

# Full CI check. Run before pushing. Same pipeline as GitHub Actions.
ci: pubget l10n
	dart format --set-exit-if-changed .
	flutter analyze
	flutter test
	for p in packages/*; do \
		if [ -f "$$p/pubspec.yaml" ]; then \
			(cd "$$p" && flutter test); \
			if [ -d "$$p/example" ]; then (cd "$$p/example" && flutter test); fi; \
		fi; \
	done
