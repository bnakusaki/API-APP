import 'package:apiapp/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const ApiApp(),
    ),
  );
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
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.dark,

        //Default font family.
        // fontFamily: 'Georgia',

        //Text themes.
        textTheme: TextTheme(
          displayLarge: GoogleFonts.robotoMono(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.raleway(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          bodyMedium: GoogleFonts.raleway(color: Colors.white, fontSize: 20),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
