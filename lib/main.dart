import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:voice_rooms/Core/Theme/theme_colors.dart';
import 'package:voice_rooms/core/Language/app_languages.dart';
import 'package:voice_rooms/core/Language/locales.dart';
import 'package:voice_rooms/core/Theme/theme_cubit.dart';
import 'package:voice_rooms/core/Theme/theme_state.dart';
import 'package:voice_rooms/core/error/errorWidget/custom_error_widget.dart';
import 'package:voice_rooms/firebase_options.dart';
import 'package:voice_rooms/utilities/app_themes.dart';
import 'package:voice_rooms/utilities/git_it.dart';
import 'package:voice_rooms/utilities/router_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await GitIt.initGitIt();

    setPathUrlStrategy();

    FlutterError.onError = (FlutterErrorDetails details) {
      reportError(
        details.exception,
        details.stack,
        context: 'FlutterError',
      );

      FlutterError.presentError(details);
    };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      return CustomErrorWidget(
        errorDetails: details,
      );
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      reportError(
        error,
        stack,
        context: 'PlatformDispatcher',
      );

      return true;
    };

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (_) => ThemeCubit()..getCurrentTheme(),
          ),
          BlocProvider<AppLanguage>(
            create: (_) => AppLanguage(),
          ),
        ],
        child: const EntryPoint(),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }, (error, stack) {
    reportError(
      error,
      stack,
      context: 'runZonedGuarded',
    );
  });
}

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLan = context.watch<AppLanguage>();
    final bool isArabic = appLan.appLang.name == 'ar';

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        final bool isDark = themeState.isDark;
        final currentTheme = AppThemes.createTheme(
          isArabic: isArabic,
          isDark: isDark,
        ).copyWith(
          extensions: <ThemeExtension<dynamic>>[
            isDark ? AppColors.dark : AppColors.light,
          ],
        );

        return ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 599, name: MOBILE),
            const Breakpoint(start: 600, end: 1439, name: TABLET),
            const Breakpoint(start: 1440, end: double.infinity, name: DESKTOP),
          ],
          child: MaterialApp.router(
            locale: Locale(appLan.appLang.name),
            supportedLocales:
                Languages.values.map((e) => Locale(e.name)).toList(),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.noScaling,
                  boldText: false,
                ),
                child: child!,
              );
            },
            scrollBehavior: MyCustomScrollBehavior(),
            routerConfig: GoRouterConfig.router,
            theme: currentTheme,
            themeAnimationCurve: Curves.easeInOut,
            themeAnimationDuration: Duration(milliseconds: 300),
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad
      };
}
