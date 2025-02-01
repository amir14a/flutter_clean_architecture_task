<a href="https://github.com/amir14a/flutter_clean_architecture_task/actions"><img src="https://github.com/amir14a/flutter_clean_architecture_task/actions/workflows/ci_actions.yml/badge.svg" alt="Build Status"></a> <a href="https://github.com/amir14a/flutter_clean_architecture_task/actions"><img src="https://github.com/amir14a/flutter_clean_architecture_task/actions/workflows/cd_actions.yml/badge.svg" alt="Build Status"></a>
# Flutter Clean Architecture Task by AmirAbbas Jannatian

## About this repository

This is a code challenge task that is written in flutter and dart. it uses the "Clean Architecture" approach and modular programming.

## Goal
A modular app with a single feature called "UserDetails". This page displays the user's name and email in a simple UI, and the user can enter their phone number to be saved in either remote or local data sources. Non-Iranian phone numbers shouldn't be accepted.

I followed the "Separation Of Concers" concept and implemented each layer as separate as possible from other layers.

## Tools and Technologies

These tools and technologies helped me during the development proccess of this app:
- **Git**: a popular version control system to manage app changes.
- **Git flow**: a branching model and command-line tool for git, for better development experience.
- **Clean architecture**: an approach for writing cleaner, more testable, and maintainable code.
- **Test-Driven Development**: an approach for writing tests before the actual code is written and refactoring code and passing tests in a cycle.
- **SOLID principles**: 5 important principles in Object Oriented Programming.
- **Modular programming**: an approach to keep each feature separate from others to increase reusability of the code.
- **Testing**: this app provides two types of tests for different layers of application: Unit tests and Widget tests.
- **mocktail**: a dart package to mock behavior of dependencies to do unit tests independent to them.
- **dotenv_flutter**: a package for keeping security keys locally and more secure.
- **flutter_bloc**: a state management package for flutter, a good one.
- **get_it**: a dart package for dependency injection in applications.
- **encrypt_shared_preferences**: a package for encrypting data that stored in local storage.
- **Github actions**: a powerful feature from github to automate CI/CD actions.

## CI/CD

**Continuous Integration (CI):** in summary, to run all tests automatically and verify that application has correct functionality every time we write a new code.

**Continuous Delivery (CI):** in summary, to compile and generate final exports and relase them automatically that users can install on their devices.

Fortunately, using GitHub's excellent feature called GitHub Actions, both of these purposes have been implemented for this project. You can view the test results [here](https://github.com/amir14a/flutter_clean_architecture_task/actions/workflows/ci_actions.yml), and the installable outputs are available below.

- [🌎 Open web application 🌎](https://amir14a.github.io/flutter_clean_architecture_task/)
- [🤖 Download .apk for android 🤖](https://github.com/amir14a/flutter_clean_architecture_task/releases/latest)
  * You need to allow unknown sources in android settings to install apk from your browser.
- [📱 Download .ipa for iOS 📱](https://github.com/amir14a/flutter_clean_architecture_task/releases/latest)
  * You can install iOS export on your phone with help of this great service: [sideloadly.io](https://sideloadly.io)

## Installation

If you are familiar to flutter, you can clone this repository and build this app on your own system.
To do that, follow these commands:

1- Clone the repository and change current directory to its directory:
```cmd
git clone git@github.com:amir14a/flutter_clean_architecture_task.git
cd flutter_clean_architecture_task
```
2- Create a file named .env in the root of the project and set SHARED_PREFERENCES_KEY value like this example:
> [!CAUTION]
> You can set any string, but your string key must be 16 characters long.

```.env
SHARED_PREFERENCES_KEY=1234567891234567
```

3- Run flutter pub get and flutter run to run the application:
```cmd
flutter pub get
flutter run
```

## Video

This is a short video that shows functionality of this application:


https://github.com/user-attachments/assets/cf6febf3-c866-4bd0-8465-43465b46c91f


## Thanks

Thank you for reading this readme and for checking my work and codes! If there is any doubt in the codes
or other things, I glad to answer:

- [a.abbasj@yahoo.com](mailto:a.abbasj@yahoo.com)
- [@amir_a14 on Telegram](https://t.me/amir_a14)

Sincerely,
  AmirAbbas Jannatian
