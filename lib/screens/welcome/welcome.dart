import 'package:apiapp/screens/welcome/privacyPolicies.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:apiapp/main.dart' as main;
import 'package:go_router/go_router.dart';

////////////////////////////////////////////////////////////////////////////////
DecorationImage background = const DecorationImage(
  image: AssetImage('assets/images/image2.png'),
  fit: BoxFit.cover,
);

// Color tint = Colors.black45;

EdgeInsets screenPad = const EdgeInsets.symmetric(horizontal: 20, vertical: 20);

////////////////////////////////////////////////////////////////////////////////

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    context.setLocale(main.localeState);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.tealAccent,
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
                    child: Text(
                      'APY',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Semantics(
                        readOnly: true,
                        child: _buildPrivacyMessage(
                          message: 'ws_txt0'.tr(),
                          textStyle: Theme.of(context).textTheme.titleLarge!,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 10,
                      color: Color.fromARGB(255, 9, 40, 66),
                    ),
                    Semantics(
                      readOnly: true,
                      child: _buildPrivacyMessage(
                        message: 'ws_txt1'.tr(),
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Policy(
                                    type: 'privacy',
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'ws_txt2'.tr(),
                              style: GoogleFonts.delius(
                                color: const Color.fromARGB(255, 9, 40, 66),
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
                          return context.go('/introScreen');
                        },
                        child: Container(
                          height: 50,
                          width: screenWidth - 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 9, 40, 66),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'ws_txt3'.tr(),
                              style: const TextStyle(
                                fontFamily: 'Nunito_Sans',
                                color: Colors.tealAccent,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
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
}
