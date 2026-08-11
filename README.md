# English Learner

Курсовая работа по курсу Flutter mobile developer.  

Все страницы приложение повторяет имеющийся веб-сайт [http://slimbde.atwebpages.com](http://slimbde.atwebpages.com).  
Реализован переход между страницами, страница аккаунта и авторизация

## Основные скрипты генерации локализации и билд раннера

```ps
dart run build_runner build
flutter gen-l10n
```

## Firebase

```ps
npm install -g firebase-tools
firebase login
dart pub global activate flutterfire_cli
flutterfire configure
```

## Tests

Все тесты:

```bash
fvm flutter test
```

Только BLoC:

```bash
fvm flutter test test/bloc
```

Один файл:

```bash
fvm flutter test test/bloc/auth/auth_bloc_sign_in_test.dart
```



## Release

1. generage key with `upload` alias

```ps
keytool -genkey -v -keystore "%USERPROFILE%\keys\upload-keystore.jks" -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

1. add it to `android/app/build.gradle.kts`
2. assemble release

```ps
fvm flutter build appbundle --release
```

