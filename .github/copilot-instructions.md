# lcars_ui – Copilot Instructions

A Flutter package providing Star Trek LCARS (Library Computer Access and Retrieval System) theme and widgets.

## Commands

```bash
flutter pub get          # install dependencies
flutter analyze          # static analysis (uses flutter_lints)
dart format .            # format all Dart files
flutter test             # run test suite
flutter test test/path/to/test_file.dart  # run a single test file
```

## Architecture

This is a **Flutter package** (not an app). It is intended to be used as a dependency, not run directly.

Public API is exported exclusively from `lib/lcars_ui.dart`. All implementation lives under `lib/src/` and is not exported individually:

- `lib/src/theme/colors.dart` — `LcarsColors` static color constants
- `lib/src/theme/theme.dart` — `LcarsTheme.dark` ThemeData
- `lib/src/widgets/` — `LcarsButton`, `LcarsCard`, `LcarsSidebar`
- `lib/src/core/sound_service.dart` — `SoundService` (currently no-ops)

When adding a new widget or service, export it from `lib/lcars_ui.dart`.

## Key Conventions

### Visual design rules
- All user-facing label text must call `.toUpperCase()` — every widget does this.
- Text on colored LCARS surfaces is always `Colors.black` (never white).
- Button labels are **right-aligned** (`Alignment.centerRight`).

### Colors
Always use `LcarsColors` constants — never hardcode hex values. Available: `gold`, `lightGold`, `mauve`, `lavender`, `blueLavender`, `peach`, `orange`, `darkOrange`, `black`.

### Typography
The `Antonio` font (from `google_fonts`) is applied globally via `LcarsTheme`. Use `GoogleFonts.antonioTextTheme()` for new theme extensions; don't import a different font.

### Shapes
LCARS geometry follows a strict vocabulary:
- `Radius.circular(30)` — pill ends (buttons, sidebar caps)
- `Radius.circular(15)` — card title / content corners
- `Radius.circular(5)` — subtle rounding on sidebar elbow joints
- Asymmetric `BorderRadius.only(...)` is used intentionally to create the LCARS "elbow" and "cap" shapes — preserve this asymmetry in new components.

### Widget patterns
- All widgets are `StatelessWidget`.
- `LcarsSidebar` has a fixed width of `150` px.
- `LcarsCard` uses a `6`px left `BorderSide` as its primary structural border.
- `LcarsButton` exposes a `LcarsButtonShape` enum (`pill`, `leftRounded`, `rightRounded`, `rectangle`) — prefer extending this enum over ad-hoc border radius logic.

### SoundService
`SoundService.playLcarsBeep()` and `playLcarsSlider()` are intentional no-ops. Wire them up before adding real audio behavior, but don't remove the method signatures — they are part of the public API.
