import 'package:flutter/material.dart';
import 'package:flutter_assignment_2/screens/contact_screen.dart';
import 'package:flutter_assignment_2/screens/data_screen.dart';
import 'package:flutter_assignment_2/screens/home_screen.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int pageIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ContactScreen(),
    const ApiDataScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[pageIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.contact_page), label: 'Contact'),
          NavigationDestination(icon: Icon(Icons.data_usage), label: 'Data'),
        ],
        selectedIndex: pageIndex,
        onDestinationSelected: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}
