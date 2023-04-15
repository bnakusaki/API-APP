import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../core/routes.dart' as routes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('fr', 'FR'),
    ],
    path: 'assets/translations',
    fallbackLocale: const Locale('en', 'US'),
    child: const ApiApp(),
  ));
}

////////////////////////////////////////////////////////////////////////////////
const Locale localeState = Locale('en', 'US');
////////////////////////////////////////////////////////////////////////////////

class ApiApp extends StatefulWidget {
  const ApiApp({super.key});

  @override
  State<ApiApp> createState() => _ApiAppState();
}

class _ApiAppState extends State<ApiApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      routerConfig: routes.router,
      theme: ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: true,
        fontFamily: 'Nunito_Sans',

        //Text themes.
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color.fromARGB(255, 9, 40, 66),
          ),
          titleLarge:
              TextStyle(color: Color.fromARGB(255, 9, 40, 66), fontSize: 30),
          bodyLarge: TextStyle(
            color: Color.fromARGB(255, 9, 40, 66),
          ),
          bodyMedium:
              TextStyle(color: Color.fromARGB(255, 9, 40, 66), fontSize: 20),
          displaySmall: TextStyle(color: Colors.tealAccent, fontSize: 20),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
      ),
    );
  }
}
