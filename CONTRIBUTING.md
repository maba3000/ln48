# Contributing

## Setup

```bash
make pubget   # Fetch dependencies
make l10n     # Generate localization files
flutter run   # Run on any device
```

## Before committing

```bash
make format   # Auto-fix formatting
make ci       # Full CI check (format, analyze, test)
```

## Commits

Start every message with a lowercase prefix. Keep under 72 characters. One change per commit.

Prefixes: `add:`, `fix:`, `remove:`, `update:`, `rename:`, `simplify:`

```
add: map game with localized strings
fix: card flip animation in memory game
remove: unused l10n keys
update: CI to run on push only
rename: noCardsFound to memoryNoCardsFound
simplify: Makefile to 6 targets
```
