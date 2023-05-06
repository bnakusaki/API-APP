// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewIntroScreen extends StatefulWidget {
  const NewIntroScreen({super.key});

  @override
  State<NewIntroScreen> createState() => _NewIntroScreenState();
}

class _NewIntroScreenState extends State<NewIntroScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    TextStyle? textTheme = Theme.of(context).textTheme.bodyMedium;
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: const ExpandingDotsEffect(
            dotColor: Color.fromARGB(255, 9, 40, 66),
            activeDotColor: Color.fromARGB(255, 9, 40, 66),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: PageView(
              controller: _pageController,
              children: [
                _buildIntroMsg(
                    textTheme: textTheme!,
                    msg:
                        'Get expert guidance to navigate your project work like a pro and achieve success with ease.'),
                _buildIntroMsg(textTheme: textTheme, msg: 'is_txt1'),
                _buildIntroMsg(textTheme: textTheme, msg: 'is_txt2'),
              ],
            ),
          ),
          InkWell(
            child: Container(
              width: MediaQuery.of(context).size.width - 80,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 9, 40, 66),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.tealAccent,
                  ),
                ),
              ),
            ),
            onTap: () {
              context.go('/signUpScreen');
            },
          ),
        ]),
      ),
    );
  }

  Column _buildIntroMsg({
    // required double screenWidth,
    required TextStyle textTheme,
    required String msg,
  }) {
    return Column(children: [
      Expanded(
        child: Text(
          msg,
          style: textTheme,
        ),
      ),
    ]);
  }
}
