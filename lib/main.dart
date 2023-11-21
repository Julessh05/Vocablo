import 'package:bloc_implementation/bloc_implementation.dart' show BlocParent;
import 'package:flutter/material.dart';
import 'package:modern_themes/modern_themes.dart' show Themes;
import 'package:string_translate/string_translate.dart'
    hide StandardTranslations;
import 'package:vocablo/blocs/home_bloc.dart';
import 'package:vocablo/data/localization.dart';
import 'package:vocablo/storage/storage.dart';
import 'package:vocablo/views/home_view.dart';

void main() {
  Storage.init();
  runApp(const VocabloApp());
}

class VocabloApp extends StatefulWidget {
  const VocabloApp({super.key});

  @override
  State<VocabloApp> createState() => _VocabloAppState();
}

class _VocabloAppState extends State<VocabloApp> {
  @override
  void initState() {
    Translation.init(
      supportedLocales: TranslationLocales.all,
      defaultLocale: TranslationLocales.english,
      translations: translations,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* Development Settings */
      showSemanticsDebugger: false,
      showPerformanceOverlay: false,
      checkerboardRasterCacheImages: false,
      checkerboardOffscreenLayers: false,
      // Change to make Screenshots, if screenshots are captured in debug mode
      debugShowCheckedModeBanner: true,
      debugShowMaterialGrid: false,

      /* Application Settings */
      // General
      title: 'Vocablo',
      scrollBehavior: const MaterialScrollBehavior(),

      // Routes
      initialRoute: '/',
      routes: {
        '/': (_) => BlocParent(bloc: HomeBloc(), child: const Home()),
      },
      // Home set to null in order to enable use of routes
      home: null,

      // Theme
      themeMode: Themes.themeMode,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      highContrastTheme: Themes.highContrastLightTheme,
      highContrastDarkTheme: Themes.highContrastDarkTheme,

      // Locale
      locale: Translation.defaultLocation,
      supportedLocales: Translation.supportedLocales,
      localizationsDelegates: TranslationDelegates.localizationDelegates,
    );
  }
}