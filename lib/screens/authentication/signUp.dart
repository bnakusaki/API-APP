////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// above is the original code.
/// below is a tweek for an assignment.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ignore_for_file: void_checks

import 'package:apiapp/screens/authentication/signIn.dart';
import 'package:apiapp/screens/welcome/privacyPolicies.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool obscure = true;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 40, 66),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 80, 40, 0),
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
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Let\'s go!\n\n',
                              style: TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Fill in you details to get started.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildCountrySelector(),
                      _buildTextField(
                          upperRoom: 20,
                          lowerRoom: 20,
                          hintText: 'email',
                          type: 'email',
                          controller: emailController),
                      _buildTextField(
                          upperRoom: 0,
                          lowerRoom: 20,
                          hintText: 'Password',
                          type: 'password',
                          controller: passwordController),
                      _buildTextField(
                          upperRoom: 0,
                          lowerRoom: 20,
                          hintText: 'Confirm password',
                          type: 'confirmPassword',
                          controller: confirmPasswordController),
                      InkWell(
                        child: Container(
                          height: 60,
                          width: screenWidth - 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.tealAccent,
                          ),
                          child: const Center(
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                color: Color.fromARGB(255, 9, 40, 66),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // context.go('/homeScreen');
                            print('created new accont');
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) => context.go('/homeScreen'))
                                .onError(
                              (error, stackTrace) {
                                print('error ${error.toString()}');
                                return ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Failed to Create Account ', //${emailController.text.toString()}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: SizedBox(
                          width: screenWidth - 80,
                          child: Row(
                            children: [
                              const Text(
                                'already have an account,',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Log in',
                                  style: TextStyle(
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
                            const Text(
                              'By logging in, I agree to the',
                              style: TextStyle(
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
                                          builder: (context) => const Policy(
                                            type: 'terms',
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Terms of use',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'and',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Policy(
                                            type: 'privacy',
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'privacy policy',
                                      style: TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountrySelector() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
      child: Container(
        height: 72,
        width: MediaQuery.of(context).size.width - 80,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: InternationalPhoneNumberInput(
          textFieldController: phoneController,
          validator: (p0) {
            if (p0!.isEmpty) {
              return 'enter phone number';
            }
            return null;
          },
          onInputChanged: null,
          cursorColor: Colors.black,
          inputDecoration: const InputDecoration(border: InputBorder.none),
          selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG, leadingPadding: 8),
        ),
      ),
    );
  }

  Padding _buildTextField({
    required double upperRoom,
    required double lowerRoom,
    required String hintText,
    required String type,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, upperRoom, 0, lowerRoom),
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width - 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            controller: controller,
            cursorColor: const Color.fromARGB(255, 9, 40, 66),
            cursorHeight: 40,
            obscureText:
                ((type == 'password') && obscure == true) ? true : false,
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
                        icon: obscure
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.remove_red_eye_outlined))
                    : null),
            validator: (value) {
              if (type == 'email' && EmailValidator.validate(value!) == false) {
                return 'email is invalid';
              } else if (type == 'phone' && value!.isEmpty) {
                return 'enter phone number';
              } else if (type == 'password' && value!.isEmpty) {
                return 'enter password';
              } else if (type == 'confirmPassword' &&
                  value != passwordController.text) {
                return 'Passwords doesn\'t match';
              }
              return null;
            },
            keyboardType: type == 'phone'
                ? TextInputType.phone
                : type == 'password'
                    ? TextInputType.visiblePassword
                    : TextInputType.emailAddress,
          ),
        ),
      ),
    );
  }
}
