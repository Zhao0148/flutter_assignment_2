import 'package:flutter/material.dart';
import 'package:flutter_assignment_2/navigation_tab.dart';
import 'package:flutter_assignment_2/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment 2',
      theme: primaryTheme,
      home: const MainNavigator(), 
    );
  }
}

