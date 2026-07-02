// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'English Learner';

  @override
  String get pageHome => 'HOME';

  @override
  String get pageAccount => 'ACCOUNT';

  @override
  String get pageTraining => 'TRAINING';

  @override
  String get pageGeneral => 'COMMON';

  @override
  String get pageGerund => 'GERUNDS';

  @override
  String get pagePhrases => 'PHRASES';

  @override
  String get pageIdioms => 'IDIOMS';

  @override
  String get pageVerbs => 'VERBS';

  @override
  String get emailAlreadyInUse => 'email already in use';

  @override
  String get login => 'login (email)';

  @override
  String get loginAgain => 'login confirm';

  @override
  String get loginFailed => 'incorrect login or password';

  @override
  String get loginRequired => 'login is required';

  @override
  String get noInternet => 'no internet connection...';

  @override
  String get password => 'password';

  @override
  String get passwordAgain => 'password again';

  @override
  String get passwordRequired => 'password is required';

  @override
  String get passwordAgainRequired => 'password again is required';

  @override
  String get passwordTooShort => 'minimum 6 symbols';

  @override
  String get passwordsDoNotMatch => 'passwords don\'t match';

  @override
  String get registerFailed => 'register failed';

  @override
  String get signIn => 'sign in';

  @override
  String get signInCaption => 'Sign in';

  @override
  String get signInLabel => 'sign in account';

  @override
  String get signOut => 'sign out';

  @override
  String get signUp => 'sign up';

  @override
  String get signUpLabel => 'create account';

  @override
  String get infoTitle => 'DATABASE';

  @override
  String get infoWords => 'Words';

  @override
  String get infoPhrases => 'Phrases';

  @override
  String get infoGerunds => 'Gerunds';

  @override
  String get infoPhrasals => 'Phrasals';

  @override
  String get infoIdioms => 'Idioms';
}
