import 'package:apiapp/screens/accountsScreen.dart';
import 'package:apiapp/screens/authentication/signUp.dart';
import 'package:apiapp/screens/welcome/readMorePolicies.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/image1.webp'), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black45,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'APY',
                    style: GoogleFonts.robotoMono(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText('We value your privacy',
                                textStyle: GoogleFonts.raleway(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left),
                          ],
                          isRepeatingAnimation: false,
                        ),
                      ),
                      const Divider(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            RotateAnimatedText(
                              'To give you a more personilised\nexperience we collect certain personal\ndata',
                              textStyle: GoogleFonts.raleway(
                                  color: Colors.white, fontSize: 20),
                              rotateOut: false,
                              alignment: Alignment.topLeft,
                            ),
                          ],
                          isRepeatingAnimation: false,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(_createPageRoute1());
                            },
                            child: Text(
                              'Read more >',
                              style: GoogleFonts.delius(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(_createPageRoute2());
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Let\'s start',
                              style: GoogleFonts.robotoMono(
                                color: Colors.white,
                                fontSize: 20,
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

  PageRouteBuilder _createPageRoute1() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const Scaffold(body: ReadMore()),
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

  PageRouteBuilder _createPageRoute2() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SignUpScreen(),
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
