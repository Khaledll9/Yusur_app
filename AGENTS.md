# Yusur_app — AGENTS.md

## Quick start

```bash
flutter pub get          # install deps
flutter gen-l10n         # regenerate localisation from lib/l10n/*.arb
flutter analyze          # lint + static analysis (uses flutter_lints)
flutter test             # run tests (single stale default test only)
flutter run              # launch app (defaults to iOS Simulator; use -d for others)
```

## Architecture

**Single-package Flutter app** — no monorepo, no packages.

```
lib/
├── main.dart              # entrypoint (init Prefs, setupLocator, runApp)
├── locator.dart           # get_it service locator
├── cubit_provider.dart    # MultiBlocProvider wiring
├── api/                   # Dio-based HTTP layer (ApiConsumer abstraction)
├── models/                # equatable data classes (fromJson/toJson, snake_case keys)
├── repositories/          # dartz Either<Failure, T> interface + impl
├── view_models/           # flutter_bloc Cubits
├── views/                 # screen widgets (go_router routes)
├── widget/                # shared widgets
├── cache/                 # SharedPreferences singleton (Prefs)
├── test_model/            # hardcoded mock data (not actual tests)
├── generated/             # auto-generated: l10n/ (from .arb), intl/
└── utils/                 # app_images.dart (auto-generated), app_icons.dart, app_color.dart, app_text_styles.dart
```

**State management:** flutter_bloc via Cubits; DI via get_it.

**Routing:** go_router (see `lib/routes/app_routes.dart`). Routes use named params; some pass data via `state.extra`.

**Network:** Dio wrapped in `ApiConsumer` interface. Base URL is `https://baseUrl/api/v1/` (placeholder). Token in `api_interceptors.dart` is a placeholder. Repositories return `dartz Either<String, T>`.

**Localisation:** Flutter Intl via ARB files (`lib/l10n/intl_{ar,en}.arb`). Default locale hardcoded to `ar` in `main.dart`. Run `flutter gen-l10n` after editing .arb files.

**Assets:** Declared in `pubspec.yaml` (images, SVG, fonts). Image constants are auto-generated in `lib/utils/app_images.dart`.

## Key conventions

- All models use `equatable` with `fromJson`/`toJson`; JSON keys are **snake_case**.
- `Prefs.init()` must be called before accessing SharedPreferences — already done in `main()`.
- The `CourseTestCubit` in the locator uses hardcoded mock data from `test_model/`. The real `CourseCubit` (repo-backed) exists but is **not registered** in the locator.
- The single widget test (`test/widget_test.dart`) is the default Flutter counter test — **stale** and unrelated to the app.
= No CI workflows exist.
- No code coverage configuration.
