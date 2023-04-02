import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 150,
          collapsedHeight: 80,
          pinned: true,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: const Text(
            'APY',
          ),
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.notifications,
                size: 35,
              ),
            ),
            InkWell(
              child: CircleAvatar(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: null,
                  child: Text(
                    'Buy a project',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: null,
                  child: Text(
                    'Freelance a project',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
