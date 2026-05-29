<p align="center">
  <img src="assets/images/app_icon_white.png" alt="Yusur App Logo" width="120" height="120"/>
</p>

<h1 align="center">Yusur App</h1>
<p align="center"><strong>Institute Management & Course Booking Platform</strong></p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.29-02569B?logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-3.9-0175C2?logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/State_Management-flutter_bloc-0288D1" alt="BLoC"/>
  <img src="https://img.shields.io/badge/DI-get_it-FF5722" alt="get_it"/>
  <img src="https://img.shields.io/badge/Routing-go_router-4CAF50" alt="go_router"/>
  <img src="https://img.shields.io/badge/HTTP-Dio-1565C0" alt="Dio"/>
  <img src="https://img.shields.io/badge/Functional_Either-dartz-7B1FA2" alt="dartz"/>
  <img src="https://img.shields.io/badge/Localisation-Flutter_Intl-FF6F00" alt="Intl"/>
  <img src="https://img.shields.io/badge/Locale-ar_|_en-FFAB00" alt="Arabic/English"/>
  <img src="https://img.shields.io/badge/License-MIT-yellow" alt="License"/>
</p>

---

## 1. The Problem & The Solution

**Problem:** Educational institutes—particularly training centres and private academies—lack a unified, cross-platform system to manage course catalogues, handle student registrations, process bookings, and broadcast announcements. Most existing solutions are either fragmented across spreadsheets, limited to a single platform, or prohibitively expensive for small-to-medium institutes.

**Solution:** Yusur App is a cross-platform mobile application that provides institutes with a centralised course management and booking ecosystem. It decouples the presentation layer from the business domain through a layered architecture — enabling maintainable, testable, and scalable software delivery. The system is designed as a single-page application with declarative routing, reactive state management, and a functional error-handling pipeline.

---

## 2. Architectural Patterns & Software Engineering Principles

### 2.1 BLoC Pattern (Business Logic Component)

The application employs **flutter_bloc** with the **Cubit** variant to enforce a strict unidirectional data flow between the UI and business logic layers:

```
Event (User Action) → Cubit → New State → UI Rebuild
```

- **View** (Widgets) — stateless, presentation-only. Never contains business logic.
- **Cubit** (ViewModel) — state machine driven by methods; emits typed states (`CourseLoading`, `CourseListLoaded`, `CourseError`, etc.).
- **State classes** — immutable `Equatable` objects ensuring referential transparency and efficient rebuilds via `bloc`'s built-in diffing.

This clean separation guarantees that any change in business requirements only touches the Cubit layer without cascading into UI code.

### 2.2 Repository Pattern with Functional Error Handling

All data access is abstracted behind **repository interfaces** that return `dartz.Either<String, T>` — a functional monad capturing either a failure (`Left`) or a successful value (`Right`). This eliminates try-catch sprawl and makes error paths explicit at the type level.

```dart
// CourseRepository example
Future<Either<String, Course>> getCourseById(int id);
Future<Either<String, List<Course>>> getCourses();
```

Repositories delegate HTTP operations to an **abstract `ApiConsumer`** interface, implemented by `DioConsumer`. This abstraction allows swapping the HTTP client without altering repository logic.

### 2.3 Dependency Injection via Service Locator

The **`get_it`** service locator centralises object creation and lifecycle management. All dependencies — Cubits, repositories, API clients — are registered in `lib/locator.dart` and resolved at the composition root (`main.dart`). This decouples object construction from consumption and facilitates unit testing via mock injection.

### 2.4 Declarative Routing

**go_router** provides URL-based, declarative routing with type-safe navigation. Route definitions in `lib/routes/app_routes.dart` follow a hierarchical tree structure with named route constants:

```dart
GoRoute(
  name: AppRoutes.courseView,
  path: '/course',
  builder: (context, state) => const CourseView(),
  routes: [
    GoRoute(
      name: AppRoutes.courseDetailView,
      path: '/courseDetail',
      builder: (context, state) =>
          CourseDetailsView(course: state.extra as Course),
    ),
  ],
);
```

Data is passed between screens via `state.extra` — avoiding global singletons and preserving type safety.

---

## 3. Key Engineering Features & Technical Depth

| Feature | Engineering Detail |
|---|---|
| **Reactive State Management** | All UI components observe typed Cubit states; only the affected widgets rebuild on state change, eliminating unnecessary renders |
| **Functional Error Handling** | `dartz.Either` monad chains operations without exceptions; errors propagate as typed values through the repository layer |
| **Centralised HTTP Layer** | `Dio` client with custom interceptor for token injection, `LogInterceptor` for debugging, and centralised exception handling via `handleDioExceptions` |
| **Localisation Architecture** | Flutter Intl with ARB source files (`intl_ar.arb`, `intl_en.arb`); locale hardcoded to Arabic (ar) with English fallback |
| **Immutable Domain Models** | All models extend `Equatable` with `fromJson`/`toJson`; JSON keys follow snake_case convention |
| **Client-Side Caching** | `SharedPreferences` singleton (`Prefs`) with typed getters for boolean and string values |
| **Offline-Ready Mock Layer** | `CourseTestCubit` serves hardcoded test data, enabling UI development and demonstration without a live backend |
| **Image Upload Pipeline** | `image_picker` integration with `MultipartFile` serialisation via Dio |
| **Custom Theming** | Centralised `AppColors`, `AppIcons`, `AppImages`, and `TextStyles` — enabling system-wide visual consistency |
| **Bidirectional i18n** | Full Arabic/English support with RTL-ready navigation drawer (`flutter_zoom_drawer`) |

---

## 4. Technology Stack & Dependencies

### Core Framework

| Technology | Version | Purpose |
|---|---|---|
| Flutter | 3.29 (SDK ^3.9.2) | Cross-platform UI framework |
| Dart | ^3.9.2 | Application language |

### State Management & DI

| Package | Version | Purpose |
|---|---|---|
| `flutter_bloc` | ^9.1.1 | BLoC/Cubit state management |
| `equatable` | ^2.0.7 | Immutable value objects |
| `get_it` | ^9.2.0 | Service locator / DI |

### Routing & Navigation

| Package | Version | Purpose |
|---|---|---|
| `go_router` | ^17.0.1 | Declarative URL-based routing |
| `flutter_zoom_drawer` | ^3.2.0 | Slide-out navigation drawer |
| `curved_navigation_bar` | ^1.0.6 | Bottom navigation |

### Networking & Data

| Package | Version | Purpose |
|---|---|---|
| `dio` | ^5.9.0 | HTTP client |
| `dartz` | ^0.10.1 | Functional programming (Either) |
| `shared_preferences` | ^2.5.4 | Local key-value storage |
| `pretty_dio_logger` | ^1.4.0 | HTTP request/response logging |

### UI & Assets

| Package | Version | Purpose |
|---|---|---|
| `hugeicons` | ^1.1.2 | Icon library |
| `svg_flutter` | ^0.0.1 | SVG rendering |
| `image_picker` | ^1.2.1 | Camera/gallery image selection |
| `flutter_launcher_icons` | ^0.14.4 | App icon generation |

### Localisation

| Package | Version | Purpose |
|---|---|---|
| `flutter_localizations` | SDK | i18n framework |
| `intl` | ^0.20.2 | Internationalisation utilities |

### Fonts

| Family | Weights | Source |
|---|---|---|
| LamaSans | Regular, Medium (500), SemiBold (600), Bold (700) | `assets/fonts/` |
| LamaSansExpanded | MediumExpanded (500), SemiBoldExpanded (600) | `assets/fonts/` |

---

## 5. Folder Structure

```
lib/
├── main.dart                          # App entry point — initialises DI, Prefs, runs app
├── locator.dart                       # get_it service locator registrations
├── cubit_provider.dart                # MultiBlocProvider wiring for Cubit tree
│
├── api/                               # HTTP abstraction layer
│   ├── api_consumer.dart              # Abstract interface (get, post, patch, delete)
│   ├── dio_consumer.dart              # Dio implementation
│   ├── api_interceptors.dart          # Auth token interceptor
│   ├── end_points.dart                # API key constants & endpoint paths
│   ├── errors/
│   │   ├── error_model.dart           # Server error deserialisation
│   │   └── exceptions.dart            # ServerException + DioException handler
│   └── helper_functions/
│       └── upload_image_to_api.dart   # Multipart image serialisation
│
├── models/                            # Domain entities (Equatable, JSON serialisable)
│   ├── booking_model.dart
│   ├── course_model.dart
│   ├── department_model.dart
│   ├── diplomas_model.dart
│   ├── employee_model.dart
│   ├── institute_model.dart
│   ├── institutes_model.dart
│   ├── like_model.dart
│   └── user_model.dart
│
├── repositories/                      # Data access layer
│   ├── course_repository/             # Course CRUD + search + toggle
│   │   ├── course_repository.dart     # Abstract interface
│   │   └── course_repository_impl.dart # Dio-backed implementation + DTOs
│   ├── institute_repository/          # Institute CRUD
│   └── user_repository/               # Auth (sign-in, sign-up) DTOs
│
├── view_models/                       # BLoC Cubits (business logic)
│   ├── course_cubit/                  # Course state machine
│   │   ├── course_cubit.dart          # Repository-backed Cubit
│   │   ├── course_state.dart          # Sealed state hierarchy
│   │   ├── course_test_cubit.dart     # Mock-data Cubit (active in locator)
│   │   └── course_test_state.dart     # Test state
│   ├── institute_cubit/               # Institute state machine
│   └── user_cubit/                    # User session state machine
│
├── views/                             # Screen widgets (go_router destinations)
│   ├── Authentication/                # Login & Register screens
│   ├── add_and_edit/                  # Create/Edit courses & diplomas
│   ├── choose_course_type/            # Course/Diploma type selector
│   ├── onboarding/                    # Onboarding flow (models, screens, widgets)
│   └── starting_views/                # Home, Course, Profile, Favorites, Booking
│
├── widget/                            # Shared / reusable widgets
│   ├── back_navigation_app.dart
│   ├── custom_emptystate_body.dart
│   └── custom_logout_button.dart
│
├── cache/
│   └── shared_preferences_singleton.dart  # Prefs singleton (init + typed accessors)
│
├── test_model/                        # Hardcoded mock data (dev/test only)
│   ├── test_courses.dart
│   ├── test_diploma.dart
│   └── test_institute.dart
│
├── l10n/                              # Localisation source files
│   ├── intl_ar.arb                    # Arabic strings
│   └── intl_en.arb                    # English strings
│
├── generated/                         # Auto-generated code
│   ├── l10n.dart                      # Flutter Intl generated delegate
│   └── intl/                          # Localisation message files
│
└── utils/                             # Centralised design tokens
    ├── app_color.dart                 # Colour palette
    ├── app_icons.dart                 # HugeIcons constants
    ├── app_images.dart                # Auto-generated image asset constants
    └── app_text_styles.dart           # Typography definitions
```

---

## 6. Installation & Configuration Guide

### Prerequisites

- **Flutter SDK** ^3.29 ([install guide](https://docs.flutter.dev/get-started/install))
- **Dart** ^3.9 (bundled with Flutter)
- **IDE** — Android Studio, VS Code, or IntelliJ with Flutter plugin

### Setup Steps

```bash
# 1. Clone the repository
git clone https://github.com/<your-org>/yusur_app.git
cd yusur_app

# 2. Install dependencies
flutter pub get

# 3. Regenerate localisation files (if ARB files modified)
flutter gen-l10n

# 4. Regenerate image constants (if assets modified)
# Image constants in lib/utils/app_images.dart are auto-generated
# from assets/images/ — modify pubspec.yaml's flutter_assets config as needed

# 5. Configure API endpoint
# Edit lib/api/end_points.dart:
#   EndPoint.baseUrl = "https://your-api-server.com/api/v1/";

# 6. Configure authentication token (optional, for development)
# Edit lib/api/api_interceptors.dart:
#   options.headers[ApiKey.token] = '<YOUR_TOKEN>';

# 7. Run static analysis
flutter analyze

# 8. Run the application
flutter run                        # defaults to connected device
flutter run -d chrome              # web target
flutter run -d windows             # desktop target (Windows)
```

### Platform-Specific Setup

| Platform | Notes |
|---|---|
| **Android** | `minSdkVersion 21` (set in `pubspec.yaml` → `min_sdk_android`). No additional config required. |
| **iOS** | Run on macOS with Xcode. Launcher icon configured via `flutter_launcher_icons`. |
| **Web** | Fully supported. Fonts and SVG assets render via `svg_flutter`. |
| **Windows / macOS / Linux** | Desktop entry points are scaffolded. Main `pubspec.yaml` assets declared globally. |

---

## 7. Architectural Roadmap & Future Scalability

The following enhancements are designed to elevate the system's robustness, testability, and production readiness:

### Short-Term (0–3 Months)

| Enhancement | Rationale |
|---|---|
| **Unit test suite** | Currently only one stale widget test exists. Introduce `bloc_test` for all Cubits, repository contract tests with mock `ApiConsumer`, and widget tests for each screen |
| **Repository-backed locator registration** | Replace `CourseTestCubit` (mock data) with `CourseCubit` + `CourseRepositoryImpl` + `DioConsumer` in `locator.dart` |
| **Environment configuration** | Extract `baseUrl` and other constants into `.env` (using `flutter_dotenv`) — currently hardcoded in `end_points.dart` |
| **Token management** | Replace placeholder token in `ApiInterceptor` with a real `CacheHelper` backed by `SharedPreferences` and refresh-token logic |

### Medium-Term (3–6 Months)

| Enhancement | Rationale |
|---|---|
| **Clean Architecture strict layering** | Introduce `domain/` (entities + repository interfaces) and `data/` (DTOs, repository impls, mappers) as explicit packages — fully decoupling domain from framework |
| **State persistence** | Implement `HydratedBloc` for Cubit state serialisation — surviving app restarts without re-fetching |
| **Push notifications** | Integrate Firebase Cloud Messaging for booking confirmations and course announcements |
| **CI/CD pipeline** | GitHub Actions for `flutter analyze → flutter test → flutter build` on PR and push to main |

### Long-Term (6+ Months)

| Enhancement | Rationale |
|---|---|
| **Offline-first with local DB** | Replace `SharedPreferences` with `sqflite` or `drift` (SQLite) — enabling full offline CRUD with sync-on-connect |
| **Feature-first modularisation** | Split `views/`, `view_models/`, and `repositories/` into feature modules — enabling lazy loading and independent feature testing |
| **Design system package** | Extract `app_color.dart`, `app_icons.dart`, `app_text_styles.dart`, and shared widgets into a reusable UI component library |
| **Code generation** | Adopt `freezed` for immutable state classes and `json_serializable` for model serialisation — eliminating boilerplate `fromJson`/`toJson`/`copyWith` |
| **Performance monitoring** | Integrate `Firebase Performance` and `Sentry` for crash reporting and UI jank tracking |
| **Dependency injection migration** | Consider migrating from `get_it` (runtime service locator) to a compile-time DI approach (e.g., manual injection via `RepositoryProvider`) — improving type safety at compile time |

---

## 8. License

```
MIT License

Copyright (c) 2025

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files...
```
---

<p align="center">
  <strong>Built with Flutter</strong> ·
  <a href="https://docs.flutter.dev/">Flutter Docs</a> ·
  <a href="https://bloclibrary.dev/">BLoC Library</a> ·
  <a href="https://pub.dev/packages/get_it">get_it</a> ·
  <a href="https://pub.dev/packages/go_router">go_router</a>
</p>
