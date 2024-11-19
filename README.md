# Flutter To-Do Application

A simple and efficient To-Do application built with Flutter, designed using Clean Architecture principles for scalability, maintainability, and testability.

## Features

- Create, update, and delete tasks
- Mark tasks as completed or pending
- Categorize tasks
- Search and filter tasks
- Persistent data storage
- Responsive and user-friendly UI

## Architecture

This application follows **Clean Architecture** principles, which emphasize separation of concerns, testability, and modularity. The architecture is divided into three layers:

1. **Presentation Layer**:
    - Contains UI components such as widgets, screens, and state management logic.
    - Uses `Provider` / `Riverpod` / `Bloc` (replace with your state management solution).

2. **Domain Layer**:
    - Contains business logic and use cases.
    - Defines entities and interfaces for repository abstraction.

3. **Data Layer**:
    - Manages data sources such as local database and APIs.
    - Implements repositories defined in the domain layer.
    - Handles data transformations between entities and models.

## Folder Structure

```plaintext
lib/
├── core/                  # Common utilities, constants, and themes
├── data/                  # Data layer
│   ├── datasources/       # Local and remote data sources
│   ├── models/            # Data models
│   └── repositories/      # Repository implementations
├── domain/                # Domain layer
│   ├── entities/          # Core application entities
│   ├── repositories/      # Repository interfaces
│   └── usecases/          # Application use cases
├── presentation/          # Presentation layer
│   ├── screens/           # UI screens
│   ├── widgets/           # Reusable widgets
│   └── state/             # State management (e.g., Bloc, Provider)
└── main.dart              # Application entry point
