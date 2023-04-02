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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellow,
        brightness: Brightness.light,
        useMaterial3: true,

        //Text themes.
        textTheme: TextTheme(
          displayLarge: GoogleFonts.robotoMono(
            color: Colors.black,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.raleway(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          bodyMedium: GoogleFonts.raleway(color: Colors.black, fontSize: 20),
          bodyLarge: GoogleFonts.raleway(
              color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
