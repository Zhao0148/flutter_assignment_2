import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset('assets/img/bird2.png', fit: BoxFit.cover),
          ),
          Expanded(
            child: Container(
              child: const Center(
                child: Text(
                  'This is the bottom half with a dark background',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
