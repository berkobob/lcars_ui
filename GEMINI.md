# lcars_ui

A Flutter package providing Star Trek LCARS (Library Computer Access and Retrieval System) theme and widgets.

## Project Overview

- **Purpose:** To provide a comprehensive set of Flutter widgets and a theme that captures the iconic LCARS aesthetic from Star Trek: The Next Generation era.
- **Main Technologies:** Flutter, Google Fonts (`Antonio`).
- **Architecture:** Standard Flutter package structure with a `lib/src/` directory for internal implementation and a top-level `lib/lcars_ui.dart` for exports.

## Building and Running

Since this is a Flutter package, it is intended to be used as a dependency in other Flutter applications.

### Key Commands

- **Fetch dependencies:**
  ```bash
  flutter pub get
  ```
- **Run static analysis:**
  ```bash
  flutter analyze
  ```
- **Format code:**
  ```bash
  dart format .
  ```
- **Run tests (if added):**
  ```bash
  flutter test
  ```

## Development Conventions

### Theme & Styling
- **Colors:** Use the `LcarsColors` class for iconic LCARS colors (Gold, Mauve, Lavender, etc.).
- **Typography:** The `Antonio` font is used throughout the theme to provide the condensed, high-tech look of LCARS. Labels should generally be in uppercase using `.toUpperCase()`.
- **Shapes:** LCARS design relies on specific geometric shapes:
  - **Pills:** Rounded on both ends.
  - **Rounded Corners:** Often rounded only on one side (e.g., `leftRounded`, `rightRounded`) to create "elbow" joints or segments.
  - **Thickness:** Sidebar segments and card headers often use specific widths/heights to maintain proportions.

### Widgets
- **LcarsButton:** Supports various shapes (`pill`, `leftRounded`, `rightRounded`, `rectangle`).
- **LcarsCard:** Features a thick left border and a title block with a rounded top-right corner.
- **LcarsSidebar:** A layout component for placing LCARS-style controls in a vertical stack with stylized top and bottom caps.

### Core Services
- **SoundService:** Provides placeholders for LCARS sound effects (`playLcarsBeep`, `playLcarsSlider`). Note: Currently, these are no-ops.

## File Structure

- `lib/lcars_ui.dart`: Public API exports.
- `lib/src/theme/`: LCARS colors and theme definitions.
- `lib/src/widgets/`: Core UI components.
- `lib/src/core/`: Internal utility services (e.g., sound).
