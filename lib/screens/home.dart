// ignore_for_file: must_be_immutable

import 'package:apiapp/screens/anonymous_screens/send_anonymous.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  SizedBox addSpace = const SizedBox(
    height: 20,
  );

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                height: 50,
                width: 250,
                color: Colors.tealAccent,
                child: const Center(
                  child: Text(
                    'Send anonymously',
                    style: TextStyle(
                      color: Color.fromARGB(255, 9, 40, 66),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SendAnonymous(),
                  ),
                );
              },
            ),
            addSpace,
            InkWell(
              child: Container(
                height: 50,
                width: 250,
                color: Colors.tealAccent,
                child: const Center(
                  child: Text(
                    'Read anonymously',
                    style: TextStyle(
                      color: Color.fromARGB(255, 9, 40, 66),
                    ),
                  ),
                ),
              ),
            ),
            addSpace,
            InkWell(
              onTap: () {
                FirebaseAuth.instance
                    .signOut()
                    .then((value) => context.go('/signInScreen'));
              },
              child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Color.fromARGB(255, 9, 40, 66),
                    ),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
