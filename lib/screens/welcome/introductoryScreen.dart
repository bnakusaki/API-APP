import 'package:apiapp/screens/home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:apiapp/main.dart' as main;

class IntroductoryScreen extends StatefulWidget {
  const IntroductoryScreen({super.key});

  @override
  State<IntroductoryScreen> createState() => _IntroductoryScreenState();
}

class _IntroductoryScreenState extends State<IntroductoryScreen> {
  final PageController _pageController = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    TextStyle? textTheme = Theme.of(context).textTheme.bodyLarge;
    double screenWidth = MediaQuery.of(context).size.width;
    context.setLocale(main.localeState);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Hero(
          tag: 'hero1',
          child: Text(
            'APY',
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: const [TextButton(onPressed: null, child: Text('Sign In'))],
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 80),
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              if (value == 2) {
                onLastPage = true;
              } else {
                onLastPage = false;
              }
            });
          },
          children: <Widget>[
            _buildIntro(
              screenWidth: screenWidth,
              textTheme: textTheme!,
              msg: 'intro1',
            ),
            _buildIntro(
              screenWidth: screenWidth,
              textTheme: textTheme,
              msg: 'intro2',
            ),
            _buildIntro(
              screenWidth: screenWidth,
              textTheme: textTheme,
              msg: 'intro3',
            )
          ],
        ),
      ),
      bottomSheet: SizedBox(
        height: 80,
        child: (!onLastPage)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => _pageController.jumpToPage(2),
                    child: const Text('Skip'),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const WormEffect(
                        activeDotColor: Colors.white,
                      ),
                      onDotClicked: (index) => _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn),
                    child: const Text('Next'),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  child: SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Center(
                      child: Text(
                        'get_started'.tr(),
                        style: textTheme,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, _buildPageRoute());
                  },
                ),
              ),
      ),
    );
  }

  Column _buildIntro({
    required double screenWidth,
    required TextStyle textTheme,
    required String msg,
  }) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: const AssetImage('assets/images/image2.png'),
          radius: screenWidth * 0.4,
        ),
        Expanded(
          child: Text(
            msg.tr(),
            style: textTheme,
          ),
        ),
      ],
    );
  }

  PageRouteBuilder _buildPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
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
