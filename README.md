# English Learner

```ps
dart run build_runner build
flutter gen-l10n
```

# Firebase
```ps
npm install -g firebase-tools
firebase login
dart pub global activate flutterfire_cli
flutterfire configure
```

# Tests
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