import 'package:apiapp/screens/welcome/privacyPolicies.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? status;
  final _formKey = GlobalKey<FormState>();
  bool obscure = true;
  bool showPrompt = false;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgotEmailController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    status = 'not authenticated';
  }

  signInAnon() async {
    User user = (await auth
        .signInAnonymously()
        .then((value) => context.go('/homeScreen'))) as User;
    if (user.isAnonymous) {
      setState(() {
        status = 'signed in anonymously';
      });
    } else {
      status = 'sign in failed';
    }
  }

  signOut() async {
    await auth.signOut();
    setState(() {
      status = 'signed out';
    });
  }

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
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Login\n\n',
                              style: TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Fill in you details and lets move 😜.',
                              style: TextStyle(
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
                        hintText: 'email',
                        type: 'email',
                        controller: emailController,
                      ),
                      _buildTextField(
                        upperRoom: 0,
                        lowerRoom: 8,
                        hintText: 'Password',
                        type: 'password',
                        controller: passwordController,
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
                            child: const Text(
                              'Have you forgotten your password?',
                              textAlign: TextAlign.right,
                              style: TextStyle(
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
                          child: const Center(
                            child: Text(
                              'Log in',
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

                            auth
                                .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) => context.go('/homeScreen'));
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
                                'I don\'t have an account,',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Create acc.',
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
                              'Anonymous Login',
                              style: TextStyle(
                                color: Color.fromARGB(255, 9, 40, 66),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          // signInAnon();
                          context.go('/homeScreen');
                        },
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
                              'Terms of Use',
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
                                          builder: (context) =>
                                              const Policy(type: 'terms'),
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
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Policy(type: 'privacy'),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Privacy Policies',
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
                                  controller: forgotEmailController),
                              InkWell(
                                child: Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.tealAccent,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Send',
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
                                    FirebaseAuth.instance
                                        .sendPasswordResetEmail(
                                            email: forgotEmailController.text)
                                        .then((value) {
                                      setState(() {
                                        showPrompt = false;
                                        ScaffoldMessenger.of(context)
                                            .showMaterialBanner(
                                          MaterialBanner(
                                            content: const Text(
                                                'Check email for reset instructions'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentMaterialBanner();
                                                },
                                                child: const Text('Dismiss'),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                    });
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
    required var controller,
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
            controller: controller,
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
