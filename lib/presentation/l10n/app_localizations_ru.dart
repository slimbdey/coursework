// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Английский ученик';

  @override
  String get pageHome => 'ГЛАВНАЯ';

  @override
  String get pageAccount => 'АККАУНТ';

  @override
  String get pageTraining => 'ТРЕНИНГ';

  @override
  String get pageGeneral => 'ОБЩИЕ';

  @override
  String get pageGerund => 'ГЕРУНДИЙ';

  @override
  String get pagePhrases => 'ФРАЗЫ';

  @override
  String get pageIdioms => 'ИДИОМЫ';

  @override
  String get pageVerbs => 'ГЛАГОЛЫ';

  @override
  String get emailAlreadyInUse => 'email уже занят';

  @override
  String get login => 'логин (email)';

  @override
  String get loginAgain => 'логин еще раз';

  @override
  String get loginFailed => 'неверный логин или пароль';

  @override
  String get loginRequired => 'логин обязателен';

  @override
  String get noInternet => 'отсутствует интернет...';

  @override
  String get password => 'пароль';

  @override
  String get passwordAgain => 'пароль еще раз';

  @override
  String get passwordRequired => 'пароль обязателен';

  @override
  String get passwordAgainRequired => 'пароль обязателен';

  @override
  String get passwordTooShort => 'минимум 6 символов';

  @override
  String get passwordsDoNotMatch => 'пароли не совпадают';

  @override
  String get registerFailed => 'регистрация не удалась';

  @override
  String get signIn => 'войти';

  @override
  String get signInCaption => 'Войти';

  @override
  String get signInLabel => 'войти в приложение';

  @override
  String get signOut => 'выйти';

  @override
  String get signUp => 'регистрация';

  @override
  String get signUpLabel => 'зарегистрироваться';

  @override
  String get infoTitle => 'СОСТАВ БД';

  @override
  String get infoWords => 'Слов';

  @override
  String get infoPhrases => 'Фраз';

  @override
  String get infoGerunds => 'Герундиев';

  @override
  String get infoPhrasals => 'Фразовых';

  @override
  String get infoIdioms => 'Идиом';

  @override
  String get searchFormTitle => 'АНГЛИЙСКИЙ УЧЕНИК';

  @override
  String get searchFormHint1 => 'Введите слово или часть слова';

  @override
  String get searchFormHint2 => 'Используйте Русский или Английский алфавит';

  @override
  String get searchFormPlaceholder => 'введите ваш запрос';

  @override
  String get searchFormSubmit => 'найти';

  @override
  String searchFormMatches(int count) {
    return 'СОВПАДЕНИЙ: $count';
  }

  @override
  String get idiomsTitle => 'ТРЕНИРОВКА ИДИОМ';

  @override
  String get idiomsSubtitle => 'ЗАПОЛНИТЕ ПРОБЕЛЫ ПОДХОДЯЩЕЙ ИДИОМОЙ';

  @override
  String idiomsCorrect(int count) {
    return 'Верно: $count';
  }

  @override
  String idiomsIncorrect(int count) {
    return 'Неверно: $count';
  }

  @override
  String idiomsTotal(int percent) {
    return 'Итого: $percent%';
  }

  @override
  String get idiomsSkip => 'Пропустить';

  @override
  String idiomsQuestion(int number) {
    return 'Вопрос: $number';
  }

  @override
  String idiomsTotalCount(int count) {
    return 'Всего: $count';
  }

  @override
  String get idiomsSubmit => 'OK';

  @override
  String get idiomsEmpty => 'Идиомы не найдены';

  @override
  String get idiomsFinished => 'Тренировка завершена';
}
