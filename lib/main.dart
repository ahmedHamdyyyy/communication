import 'package:communication/feature/Home/ui/AllPostsScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constant/theme.dart';
import 'feature/Auth/cubit/auth_cubit.dart';
import 'feature/Auth/ui/login_screen.dart';
import 'feature/Home/cubit/home_cubit.dart';
import 'feature/Home/cubit/home_state.dart';
import 'feature/Home/ui/Home.dart';
import 'service/Cache.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesHelper.getSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) => HomeCubit()..getLanguage()..getTheme(),
        ),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            previous.currentLang != current.currentLang ||
            previous.currentTheme != current.currentTheme,
        builder: (context, state) {
          systemTheme(state);
          return MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: Locale(state.currentLang),
            theme: appThemes(state.currentTheme),

            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,

            home: SharedPreferencesHelper.contains("user")
                ? const HomePostsScreen()
                : const LoginScreen(),
          );
        },
      ),
    );
  }
}
