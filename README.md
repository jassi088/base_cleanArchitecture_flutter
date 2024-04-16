## Getting Started

### Requirements

- Dart: 3.4.0
- Flutter SDK: 3.21.0

### Install

- WARN: If you already installed `make`, you could omit this step.

- Install make:
    - Run `choco install make`
  
### Config and run app

- cd to root folder of project
- Run `make gen_env`
- Run `make pub_get`
- Run `make run_dev`
- Run & Enjoy!

## Technology stack details

|     | Description |
|:----|:----|
| State Management | [flutter_bloc](https://pub.dev/packages/flutter_bloc) - Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern. Built to be used with the bloc state management package. |
| Navigation | [auto_route](https://pub.dev/packages/auto_route) - A declarative routing solution, where everything needed for navigation is automatically generated. |
| Dependency Injection | [get_it](https://pub.dev/packages/get_it) , [injectable](https://pub.dev/packages/injectable) - Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App. |
| Networking | [retrofit](https://pub.dev/packages/retrofit) - An dio client generator using source_gen and inspired by Chopper and Retrofit. |
| Preferences | [encrypted_shared_preferences](https://pub.dev/packages/encrypted_shared_preferences) - A plugin that stores Shared Preferences as encrypted values on device storage. |
| Data class | [freezed](https://pub.dev/packages/freezed) , [json_serializable](https://pub.dev/packages/json_serializable) - Code generation for immutable classes that has a simple syntax/API without compromising on the features. |
| Paging | [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination) - Lazily load and display pages of items as the user scrolls down your screen. |
| Utils | [rxdart](https://pub.dev/packages/rxdart) , [dartx](https://pub.dev/packages/dartx) , [async](https://pub.dev/packages/async) - RxDart is an implementation of the popular reactiveX api for asynchronous programming, leveraging the native Dart Streams api. |
| Assets generator | [flutter_gen_runner](https://pub.dev/packages/flutter_gen_runner) , [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) , [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) - A package which simplifies the task of updating your Flutter app's launcher icon, splash. |
| Shimmer | [shimmer](https://pub.dev/packages/shimmer) - A package that provides an easy way to add shimmer effect in Flutter project. |
| Unit Test | [mocktail](https://pub.dev/packages/mocktail) , [bloc_test](https://pub.dev/packages/bloc_test) - A Dart mock library which simplifies mocking with null safety support and no manual mocks or code generation. |

## Features

- [x] Authentication
- [x] Theme Dark mode
- [x] Change App Language
- [x] Nested navigation
- [x] Retry when error
- [x] Load more, Refreshed
- [x] Shimmer loading
