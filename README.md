## Architecture

![Architecture](images/project_architecture.jpg?raw=true)

## 📋 <a name="table">Table of Contents</a>

1. 🤖 [Introduction](#introduction)
2. ⚡️ [Requirements](#requirements)
3. ☄️ [Install](#install)
4. 🚀 [How to run app](#run-app)
5. ⚙️ [Tech Stack](#tech-stack)
6. 🔋  [Features](#features)
7. 🔥  [Starting new project](#starting)

## <a name="introduction">🤖 Introduction</a>
- Base cleanArchitecture uses Clean Architecture and Bloc Pattern to build projects with ready-to-use components for new projects. It integrates technologies to implement features quickly and easily.

- Clean Architecture concept:
    + Multi-layered architecture
    + Isolate Business Rules
    + The concentric circles represent the 'layers,' with the inner circles being more abstract (high level), and the outer circles being more detailed (low level).
    + Dependency Inversion (DI) - SOLI<b><i>D</i></b>
        - High level does not depend on low level; both depend on abstraction.
        - Abstraction does not depend on details but vice versa.

### <a name="requirements">⚡️ Requirements</a>

- Dart: 3.4.0
- Flutter SDK: 3.21.0

### <a name="install">☄️ Install</a>

- WARN: If you already installed `make`, you could omit this step.

- Install make:
    - Run `choco install make`
  
### <a name="run-app">🚀 How to run app</a>

- cd to root folder of project
- Run `make gen_env`
- Run `make pub_get`
- Run `make run_dev`
- Run & Enjoy! 🎉.

## <a name="tech-stack">⚙️ Technology stack details</a>

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

## <a name="features">🔋 Features</a>

- [x] Authentication
- [x] Theme Dark mode
- [x] Change App Language
- [x] Nested navigation
- [x] Retry when error
- [x] Paging Load more, Refreshed
- [x] Shimmer loading

## <a name="starting">🔥 Starting new project</a>

### 1. Config multi-flavors

- Current Project Settings:
    - min Android OS: 26 (android 8)
    - min iOS OS: 13.0
    - Production Bundle id (application id): `com.app.buzzlp`
      
- Change flavor settings:
    - Replace all `com.app.buzzlp` by your project bundle id (application id)
    - Config flavors for Android at [build.gradle](android/app/build.gradle)
        - Application name: find and change values of: `manifestPlaceholders["applicationName"]`
        - Version name: find and change values of: `versionName`
        - Version code: find and change values of: `versionCode`
    - Config flavors for iOS at: 
        - [Develop.xcconfig](ios/Flutter/Develop.xcconfig)
        - [Qa.xcconfig](ios/Flutter/Qa.xcconfig)
        - [Staging.xcconfig](ios/Flutter/Staging.xcconfig)
        - [Production.xcconfig](ios/Flutter/Production.xcconfig) 

- Build and release an Android app:
    - Create a file named `key.properties` at [android](android)
    - Reference Link: [Docs](https://docs.flutter.dev/deployment/android#reference-the-keystore-from-the-app).

### 2. Other Configs

- Change the app icon at [app_icon/app_icon.yaml](app_icon/app_icon.yaml)<br>
    - Run `make update_app_icon`

- Change the splash at [splash/splash.yaml](splash/splash.yaml)<br>
    - Run `make update_splash`

- Change the default settings of the app: `designDeviceWidth`, `designDeviceHeight`, `materialAppTitle`, `taskMenuMaterialAppColor`, `taskMenuMaterialAppColor`, `systemUiOverlay`, `mobileOrientation` `tabletOrientation` in [constants](lib/shared/constants).

## MIT License

Copyright (c) 2024 BuzzLP
