import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
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
              child: const Center(child: Text('Sign Out'))),
        ),
      ),
    );
  }
}
