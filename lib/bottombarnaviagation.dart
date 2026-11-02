import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'navigation.dart';
import 'animation.dart';

class BottomBarNavigationPage extends StatefulWidget {
  const BottomBarNavigationPage({super.key});

  @override
  State<BottomBarNavigationPage> createState() => _BottomBarNavigationPageState();
}

class _BottomBarNavigationPageState extends State<BottomBarNavigationPage> {
  int _currentIndex = 0;

  // Pages available in the app
  final List<Widget> _pages = [
    const ProfilePage(),
    const NavigationPage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black87,
        unselectedItemColor: const Color(0xFF757575),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alt_route),
            label: 'Roles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
        ],
      ),
    );
  }
}
