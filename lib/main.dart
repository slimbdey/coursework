import 'package:coursework/application/infrastructure/db_info_repository.dart';
import 'package:coursework/application/infrastructure/login_service.dart';
import 'package:coursework/core/crash_reporting/index.dart';
import 'package:coursework/core/dependency_injection.dart';
import 'package:coursework/firebase_options.dart' show DefaultFirebaseOptions;
import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_event.dart';
import 'package:coursework/presentation/bloc/db_info/db_info_bloc.dart';
import 'package:coursework/presentation/bloc/db_info/db_info_event.dart';
import 'package:coursework/presentation/bloc/locale/locale_bloc.dart';
import 'package:coursework/presentation/bloc/locale/locale_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/l10n/constants.dart';
import 'package:coursework/presentation/theme/index.dart';
import 'package:coursework/presentation/widgets/navigation/app_router.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await CrashReporter.attach();

    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: getProviders(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LocaleBloc()),
          BlocProvider(
            create: (context) =>
                DbInfoBloc(dbInfoRepository: context.read<DbInfoRepository>())
                  ..add(const LoadDbInfoEvent()),
          ),
          BlocProvider(
            lazy: false,
            create: (context) =>
                AuthBloc(context.read<LoginService>())
                  ..add(const CheckAuthEvent()),
          ),
        ],
        child: BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, localeState) {
            return MaterialApp.router(
              locale: localeState.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale(Locales.ru), Locale(Locales.en)],
              onGenerateTitle: (context) =>
                  AppLocalizations.of(context)!.appTitle,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light(),
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    );
  }
}
