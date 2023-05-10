import 'package:flutter/material.dart';

class ReadAnonymous extends StatelessWidget {
  const ReadAnonymous({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Read Anonymous Messages 😜😏',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: const Placeholder(),
    );
  }
}
