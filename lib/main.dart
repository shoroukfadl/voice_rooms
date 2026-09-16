import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:voice_rooms/Core/Theme/theme_colors.dart';
import 'package:voice_rooms/core/Language/app_languages.dart';
import 'package:voice_rooms/core/Language/app_styles.dart';
import 'package:voice_rooms/core/Language/locales.dart';
import 'package:voice_rooms/core/Theme/theme_cubit.dart';
import 'package:voice_rooms/core/Theme/theme_state.dart';
import 'package:voice_rooms/utilities/app_themes.dart';
import 'package:voice_rooms/utilities/git_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GitIt.initGitIt();
  //setPathUrlStrategy();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()..getCurrentTheme()),
    BlocProvider<AppLanguage>(create: (_) => AppLanguage()),
  ], child: const EntryPoint()));
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
            isDark ? AppColors.darkValues : AppColors.lightValues,
          ],
        );

        return ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 599, name: MOBILE),
            const Breakpoint(start: 600, end: 1439, name: TABLET),
            const Breakpoint(start: 1440, end: double.infinity, name: DESKTOP),
          ],
          child: MaterialApp(
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
            //routerConfig: GoRouterConfig.router,
            home: const MyHomePage(title: 'title'),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text('You have pushed the button this many times:',
                style: AppTextStyles.h1(context: context)),
            Text('$_counter', style: AppTextStyles.h1(context: context)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
