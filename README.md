# acp_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Flavours

There are a total of 3 flavors in the application:

- aimcc
- guildelines
- annals

The three applications have there own respective main files all inside the main folder

- main_aimcc.dart
- main_guidelines.dart
- main_annals.dart

For running application, we will always need to set the target file for which we are running or building the application

## Running the application.
There are a total of 3 [flutter build modes]:

- [debug](https://docs.flutter.dev/testing/build-modes#debug)
- [profile](https://docs.flutter.dev/testing/build-modes#profile)
- [release](https://docs.flutter.dev/testing/build-modes#release)

For running the 3 application you will need to run the following command:
(This will, by default, run in debug mode)

```
flutter run --flavor aimcc -t lib/main/main_aimcc.dart
flutter run --flavor guidelines -t lib/main/main_guidelines.dart
flutter run --flavor annals -t lib/main/main_annals.dart
```

For running the application on different flutter mode you will need to run the following command:

```
flutter run --<flutter mode> --flavor aimcc -t lib/main/main_aimcc.dart
flutter run --<flutter mode> --flavor guidelines -t lib/main/main_guidelines.dart
flutter run --<flutter mode> --flavor annals -t lib/main/main_annals.dart
```

## Building bundles.
There are different bundles you can make

- apk (for android)
- ipa (for ios)

For all the different modes, it will produce its build respectively, but to create only the build of the application run the following methods:
```
flutter build <bundle> --flavor aimcc -t lib/main/main_aimcc.dart
flutter build <bundle> --flavor guidelines -t lib/main/main_guidelines.dart
flutter build <bundle> --flavor annals -t lib/main/main_annals.dart
``` 

You can replace the bundle for building the ios or android application

## Adding pre-commit hooks
There is a folder named .githooks. It contains a bash file called pre-commit, which runs the following commands

- dart analyze
- flutter analyze
- flutter test

To configure the git pre-commit hooks run the following command

```
git config core.hooksPath .githooks/
```

If there is any commit is a need to commit urgently, then follow these steps
1. Go to the githooks folder.
2. Open the pre-commit file in the folder in VS code
3. Comment all the lines from the first line (Make sure that you don't comment the first line)
4. After commenting everything add the following line in the end
```
exit 0
```