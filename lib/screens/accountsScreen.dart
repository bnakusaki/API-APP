import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  final List<AssetImage> logos = [
    const AssetImage('assets/images/dart_logo.png'),
    const AssetImage('assets/images/python-logo.png'),
  ];
  final List<String> languages = [
    'Dart',
    'Python',
  ];
  int? selected;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: selected == null
              ? const AssetImage('assets/images/image1.webp')
              : logos[selected!],
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          actions: const [
            TextButton(
              onPressed: null,
              child: Text(
                'Next',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              selected == null
                  ? _buildAnimatedText(
                      message: 'What',
                      fraction: 0.1,
                      screenHeight: screenHeight)
                  : const SizedBox(),
              selected == null
                  ? _buildAnimatedText(
                      message: 'Language',
                      fraction: 0.2,
                      screenHeight: screenHeight)
                  : const SizedBox(),
              selected == null
                  ? _buildAnimatedText(
                      message: 'Would',
                      fraction: 0.3,
                      screenHeight: screenHeight)
                  : const SizedBox(),
              selected == null
                  ? _buildAnimatedText(
                      message: 'You use.',
                      fraction: 0.4,
                      screenHeight: screenHeight)
                  : Text(
                      languages[selected!],
                      style: GoogleFonts.robotoMono(
                        fontSize: 70,
                      ),
                    ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      logos.length,
                      (index) => InkWell(
                        child: Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: logos[index],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Positioned _buildAnimatedText({
    required String message,
    required double fraction,
    required double screenHeight,
  }) {
    return Positioned(
      top: screenHeight * fraction,
      child: AnimatedTextKit(
        animatedTexts: [
          RotateAnimatedText(
            message,
            textStyle: GoogleFonts.robotoMono(
              color: Colors.white,
              fontSize: 50,
            ),
            duration: Duration(milliseconds: (3000 * fraction).ceil()),
            alignment: Alignment.topLeft,
            rotateOut: false,
          ),
        ],
        isRepeatingAnimation: false,
      ),
    );
  }
}
