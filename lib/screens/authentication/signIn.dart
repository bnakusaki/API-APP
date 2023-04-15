import 'package:apiapp/screens/welcome/privacyPolicies.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool obscure = true;
  bool showPrompt = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 40, 66),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 70, 40, 0),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'sis_txt0'.tr(),
                              style: const TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'sus_txt1'.tr(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildTextField(
                        upperRoom: 130,
                        lowerRoom: 20,
                        hintText: 'sus_txt3'.tr(),
                        type: 'email',
                      ),
                      _buildTextField(
                        upperRoom: 0,
                        lowerRoom: 8,
                        hintText: 'sus_txt4'.tr(),
                        type: 'password',
                      ),
                      SizedBox(
                        width: screenWidth - 80,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showPrompt = true;
                              });
                            },
                            child: Text(
                              'sis_txt1'.tr(),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          height: 60,
                          width: screenWidth - 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.tealAccent,
                          ),
                          child: Center(
                            child: Text(
                              'sus_txt7'.tr(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 9, 40, 66),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.go('/homeScreen');
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: SizedBox(
                          width: screenWidth - 80,
                          child: Row(
                            children: [
                              Text(
                                'sis_txt2'.tr(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'sis_txt3'.tr(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 131,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'sus_txt8'.tr(),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 35,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Policy(type: 'terms'),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Terms of use'.tr(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'sus_txt10'.tr(),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Policy(type: 'policy'),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'sus_txt11'.tr(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              showPrompt
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showPrompt = false;
                                      });
                                    },
                                    icon: const Icon(Icons.cancel)),
                              ),
                              Text(
                                'Have you forgotten your password?',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                'Don\'t worry, write the email with which you are registered and we will send you the steps you must follow to change your password.',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              _buildTextField(
                                upperRoom: 20,
                                lowerRoom: 20,
                                hintText: 'email',
                                type: 'forgotEmail',
                              ),
                              InkWell(
                                child: Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.tealAccent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Send'.tr(),
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 9, 40, 66),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.go('/homeScreen');
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildTextField({
    required double upperRoom,
    required double lowerRoom,
    required String hintText,
    required String type,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, upperRoom, 0, lowerRoom),
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width - 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: type == 'forgotEmail' ? Colors.black12 : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            cursorColor: const Color.fromARGB(255, 9, 40, 66),
            cursorHeight: 40,
            obscureText: type == 'password' && obscure == true ? true : false,
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 9, 40, 66),
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                alignLabelWithHint: true,
                suffixIcon: type == 'password'
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye))
                    : null),
            validator: (value) {
              if (type == 'email' && EmailValidator.validate(value!) == false) {
                return 'email is invalid';
              } else if (type == 'name' && value!.isEmpty) {
                return 'enter name';
              } else if (type == 'password' && value!.isEmpty) {
                return 'enter password';
              }
              return null;
            },
            keyboardType: type == 'name'
                ? TextInputType.name
                : type == 'password'
                    ? TextInputType.visiblePassword
                    : TextInputType.emailAddress,
          ),
        ),
      ),
    );
  }
}
