import 'package:apiapp/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const ApiApp(),
  );
}

class ApiApp extends StatefulWidget {
  const ApiApp({super.key});

  @override
  State<ApiApp> createState() => _ApiAppState();
}

class _ApiAppState extends State<ApiApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define brigtness and Colors.
        primaryColor: Colors.white,
        brightness: Brightness.dark,

        //Default font family.
        // fontFamily: 'Georgia',

        //Text themes.
        textTheme: TextTheme(
          titleMedium: GoogleFonts.raleway(
            fontSize: 25,
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
