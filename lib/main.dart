import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dars8/core/utils/themes.dart';
import 'package:dars8/pages/home_page.dart';
import 'package:dars8/pages/lang_page.dart';
import 'package:dars8/pages/multi/multi_page.dart';
import 'package:dars8/pages/multi/time_provider.dart';
import 'package:dars8/providers/theme_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/multi/count_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    path: 'assets/tr',
    supportedLocales: const [Locale("uz"), Locale("ru"), Locale("en")],
    useOnlyLangCode: true,
    startLocale: const Locale("uz"),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return AdaptiveTheme(
    //   light: MyThemes.light,
    //   dark: MyThemes.dark,
    //   initial: AdaptiveThemeMode.system,
    //   builder: (light, dark) {
    //     return MaterialApp(
    //       title: 'Flutter Demo',
    //       debugShowCheckedModeBanner: false,
    //       themeMode: context.watch<ThemeProvider>().mode,
    //       theme: light,
    //       darkTheme: dark,
    //       home: const HomePage(),
    //     );
    //   },
    // );
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: context.watch<ThemeProvider>().mode,
            theme: MyThemes.light,
            darkTheme: MyThemes.dark,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // home: const LangPage(),
            home: MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => TimeProvider()),
                ChangeNotifierProvider(create: (_) => CountProvider()),
              ],
              builder: (context, _) => const MultiPage(),
            ),
            // home: ChangeNotifierProvider(
            //   create: (context) => CountProvider(),
            //   child: ChangeNotifierProvider(
            //       create: (context) => TimeProvider(),
            //       builder: (context, child) {
            //         return const MultiPage();
            //       }),
            // ),
          );
        });
  }
}
