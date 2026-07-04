import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In ru, this message translates to:
  /// **'Английский ученик'**
  String get appTitle;

  /// No description provided for @pageHome.
  ///
  /// In ru, this message translates to:
  /// **'ГЛАВНАЯ'**
  String get pageHome;

  /// No description provided for @pageAccount.
  ///
  /// In ru, this message translates to:
  /// **'АККАУНТ'**
  String get pageAccount;

  /// No description provided for @pageTraining.
  ///
  /// In ru, this message translates to:
  /// **'ТРЕНИНГ'**
  String get pageTraining;

  /// No description provided for @pageGeneral.
  ///
  /// In ru, this message translates to:
  /// **'ОБЩИЕ'**
  String get pageGeneral;

  /// No description provided for @pageGerund.
  ///
  /// In ru, this message translates to:
  /// **'ГЕРУНДИЙ'**
  String get pageGerund;

  /// No description provided for @pagePhrases.
  ///
  /// In ru, this message translates to:
  /// **'ФРАЗЫ'**
  String get pagePhrases;

  /// No description provided for @pageIdioms.
  ///
  /// In ru, this message translates to:
  /// **'ИДИОМЫ'**
  String get pageIdioms;

  /// No description provided for @pageVerbs.
  ///
  /// In ru, this message translates to:
  /// **'ГЛАГОЛЫ'**
  String get pageVerbs;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In ru, this message translates to:
  /// **'email уже занят'**
  String get emailAlreadyInUse;

  /// No description provided for @login.
  ///
  /// In ru, this message translates to:
  /// **'логин (email)'**
  String get login;

  /// No description provided for @loginAgain.
  ///
  /// In ru, this message translates to:
  /// **'логин еще раз'**
  String get loginAgain;

  /// No description provided for @loginFailed.
  ///
  /// In ru, this message translates to:
  /// **'неверный логин или пароль'**
  String get loginFailed;

  /// No description provided for @loginRequired.
  ///
  /// In ru, this message translates to:
  /// **'логин обязателен'**
  String get loginRequired;

  /// No description provided for @noInternet.
  ///
  /// In ru, this message translates to:
  /// **'отсутствует интернет...'**
  String get noInternet;

  /// No description provided for @password.
  ///
  /// In ru, this message translates to:
  /// **'пароль'**
  String get password;

  /// No description provided for @passwordAgain.
  ///
  /// In ru, this message translates to:
  /// **'пароль еще раз'**
  String get passwordAgain;

  /// No description provided for @passwordRequired.
  ///
  /// In ru, this message translates to:
  /// **'пароль обязателен'**
  String get passwordRequired;

  /// No description provided for @passwordAgainRequired.
  ///
  /// In ru, this message translates to:
  /// **'пароль обязателен'**
  String get passwordAgainRequired;

  /// No description provided for @passwordTooShort.
  ///
  /// In ru, this message translates to:
  /// **'минимум 6 символов'**
  String get passwordTooShort;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In ru, this message translates to:
  /// **'пароли не совпадают'**
  String get passwordsDoNotMatch;

  /// No description provided for @registerFailed.
  ///
  /// In ru, this message translates to:
  /// **'регистрация не удалась'**
  String get registerFailed;

  /// No description provided for @signIn.
  ///
  /// In ru, this message translates to:
  /// **'войти'**
  String get signIn;

  /// No description provided for @signInCaption.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get signInCaption;

  /// No description provided for @signInLabel.
  ///
  /// In ru, this message translates to:
  /// **'войти в приложение'**
  String get signInLabel;

  /// No description provided for @signOut.
  ///
  /// In ru, this message translates to:
  /// **'выйти'**
  String get signOut;

  /// No description provided for @signUp.
  ///
  /// In ru, this message translates to:
  /// **'регистрация'**
  String get signUp;

  /// No description provided for @signUpLabel.
  ///
  /// In ru, this message translates to:
  /// **'зарегистрироваться'**
  String get signUpLabel;

  /// No description provided for @infoTitle.
  ///
  /// In ru, this message translates to:
  /// **'СОСТАВ БД'**
  String get infoTitle;

  /// No description provided for @infoWords.
  ///
  /// In ru, this message translates to:
  /// **'Слов'**
  String get infoWords;

  /// No description provided for @infoPhrases.
  ///
  /// In ru, this message translates to:
  /// **'Фраз'**
  String get infoPhrases;

  /// No description provided for @infoGerunds.
  ///
  /// In ru, this message translates to:
  /// **'Герундиев'**
  String get infoGerunds;

  /// No description provided for @infoPhrasals.
  ///
  /// In ru, this message translates to:
  /// **'Фразовых'**
  String get infoPhrasals;

  /// No description provided for @infoIdioms.
  ///
  /// In ru, this message translates to:
  /// **'Идиом'**
  String get infoIdioms;

  /// No description provided for @searchFormTitle.
  ///
  /// In ru, this message translates to:
  /// **'АНГЛИЙСКИЙ УЧЕНИК'**
  String get searchFormTitle;

  /// No description provided for @searchFormHint1.
  ///
  /// In ru, this message translates to:
  /// **'Введите слово или часть слова'**
  String get searchFormHint1;

  /// No description provided for @searchFormHint2.
  ///
  /// In ru, this message translates to:
  /// **'Используйте Русский или Английский алфавит'**
  String get searchFormHint2;

  /// No description provided for @searchFormPlaceholder.
  ///
  /// In ru, this message translates to:
  /// **'введите ваш запрос'**
  String get searchFormPlaceholder;

  /// No description provided for @searchFormSubmit.
  ///
  /// In ru, this message translates to:
  /// **'найти'**
  String get searchFormSubmit;

  /// No description provided for @searchFormMatches.
  ///
  /// In ru, this message translates to:
  /// **'СОВПАДЕНИЙ: {count}'**
  String searchFormMatches(int count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
