import 'package:flutter/material.dart';
import 'profile_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Admin Profile Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _message = 'Welcome Admin';
                  });
                },
                child: const Text('Admin'),
              ),
              const SizedBox(height: 12),

              // User Profile Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _message = 'Welcome User';
                  });
                },
                child: const Text('User'),
              ),
              const SizedBox(height: 24),

              // Show Welcome Message
              if (_message.isNotEmpty)
                Text(
                  _message,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              const SizedBox(height: 40),

              // ElevatedButton that uses Navigator.push
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child: const Text('Go to Profile Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
