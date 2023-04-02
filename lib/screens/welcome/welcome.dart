import 'package:apiapp/screens/home.dart';
import 'package:apiapp/screens/welcome/introductoryScreen.dart';
import 'package:apiapp/screens/welcome/readMorePolicies.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:apiapp/main.dart' as main;

////////////////////////////////////////////////////////////////////////////////
DecorationImage background = const DecorationImage(
  image: AssetImage('assets/images/image2.png'),
  fit: BoxFit.cover,
);

// Color tint = Colors.black45;

EdgeInsets screenPad = const EdgeInsets.symmetric(horizontal: 20, vertical: 20);

List<dynamic> endpoints = [
  const ReadMore(),
  const IntroductoryScreen(),
  const HomeScreen(),
];
////////////////////////////////////////////////////////////////////////////////

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    context.setLocale(main.localeState);

    return Container(
      decoration: BoxDecoration(
        image: background,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: screenPad,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Semantics(
                    readOnly: true,
                    child: Hero(
                      tag: 'hero1',
                      child: Text(
                        'APY',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Semantics(
                          readOnly: true,
                          child: _buildPrivacyMessage(
                            message: 'msg1'.tr(),
                            textStyle: Theme.of(context).textTheme.titleLarge!,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 10,
                      ),
                      Semantics(
                        readOnly: true,
                        child: _buildPrivacyMessage(
                          message: 'msg2'.tr(),
                          textStyle: Theme.of(context).textTheme.bodyMedium!,
                        ),
                      ),
                      Semantics(
                        button: true,
                        child: SizedBox(
                          width: screenWidth - 40,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(_createPageRoute(endpointIndex: 0));
                              },
                              child: Text(
                                'read_more'.tr(),
                                style: GoogleFonts.delius(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Semantics(
                        button: true,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(_createPageRoute(endpointIndex: 1));
                          },
                          child: Container(
                            height: 50,
                            width: screenWidth - 40,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'start_msg'.tr(),
                                style: GoogleFonts.robotoMono(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildPrivacyMessage({
    required String message,
    required TextStyle textStyle,
  }) {
    return Text(
      message,
      style: textStyle,
    );
  }

  PageRouteBuilder _createPageRoute({
    required int endpointIndex,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          endpoints[endpointIndex],
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
