import 'package:bloc_architecture/core/storage/secure_storage.dart';
import 'package:bloc_architecture/features/main/presentation/business_logic/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_architecture/core/config/env_config.dart';
import 'package:bloc_architecture/core/config/app_theme.dart';
import 'package:bloc_architecture/features/auth/business_logic/auth_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/l10n/app_localizations.dart';
import 'core/provider/language/language_bloc.dart';

import 'core/router/app_router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  const environment =
      String.fromEnvironment('ENVIRONMENT', defaultValue: 'dev');
  await EnvConfig.initialize(environment);
  final prefs = await SharedPreferences.getInstance();

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          print("Create Auth Bloc");
          AuthBloc bloc = AuthBloc();
          void checkAuth() async {
            final accessToken = await SecureStorage().readAccessToken();
            if (accessToken != null) {
              bloc.add(const AuthEvent.getUserInfo());
            }
          }

          checkAuth();
          return bloc;
        }),
        BlocProvider(create: (context) {
          print("Create Language Bloc");
          return LanguageBloc(prefs)..add(const LanguageEvent.loadLanguage());
        }),
        BlocProvider(
          create: (context) {
            print("Create Main Bloc");
            return MainBloc();
          },
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.darkTheme,
                color: const Color(0xFFE8DAB8),
                routerConfig: router,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'),
                  Locale('vi'),
                ],
                locale: Locale(state.languageCode),
              );
            },
          );
        },
      ),
    );
  }
}
