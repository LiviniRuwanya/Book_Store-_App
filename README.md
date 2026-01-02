# Book Store App

A simple Flutter app for browsing books. It shows a list of books, animated
book cards, and a detail screen for each book. This README explains what the
project is, how to run it, and where the important files are.

## Features

- Browse a list of books on the home screen
- Animated book card UI components
- Book detail view with basic information

## Requirements

- Flutter SDK (stable channel)
- A device or emulator (Android, iOS, Windows, macOS, or Linux)

## Run locally

1. Open a terminal in the project root (`Book_Store-_App`).
2. Get dependencies:

```bash
flutter pub get
```

3. Run the app on a connected device or emulator:

```bash
flutter run
```

## Project structure (important files)

- `lib/main.dart` — app entry point
- `lib/models/book.dart` — Book model
- `lib/screens/home_screen.dart` — Home screen with book list
- `lib/widgets/animated_book_card.dart` — Animated book card widget
- `assets/`, `images/` — static assets used by the app



## Notes

- This project is written in simple Flutter and is a good starting point for
	learning how to build small cross-platform apps with animated widgets.
