import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  String _selectedRole = ''; // 'Admin' or 'User'

  void _loginAs(String role) {
    setState(() {
      _selectedRole = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE0E0E0),
        elevation: 0,
        title: const Text(
          'Navigation & Roles',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Icon(
                Icons.alt_route_rounded,
                size: 64,
                color: Color(0xFF757575),
              ),
              const SizedBox(height: 16),
              const Text(
                'Select Profile Role',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose a role below to log in and test navigation',
                style: TextStyle(fontSize: 14, color: Color(0xFF757575)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Role Selection Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedRole == 'Admin'
                            ? const Color(0xFF757575)
                            : Colors.white,
                        foregroundColor: _selectedRole == 'Admin'
                            ? Colors.white
                            : const Color(0xFF757575),
                        side: const BorderSide(color: Color(0xFF757575)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.admin_panel_settings_outlined),
                      label: const Text(
                        'Admin',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => _loginAs('Admin'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedRole == 'User'
                            ? const Color(0xFF757575)
                            : Colors.white,
                        foregroundColor: _selectedRole == 'User'
                            ? Colors.white
                            : const Color(0xFF757575),
                        side: const BorderSide(color: Color(0xFF757575)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.person_outline_rounded),
                      label: const Text(
                        'User',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => _loginAs('User'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 36),

              // Display Welcome Message Area
              if (_selectedRole.isNotEmpty) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(
                        _selectedRole == 'Admin'
                            ? Icons.verified_user_rounded
                            : Icons.account_circle_rounded,
                        size: 50,
                        color: const Color(0xFF757575),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _selectedRole == 'Admin'
                            ? 'Welcome Admin'
                            : 'Welcome User',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _selectedRole == 'Admin'
                            ? 'Logged in with Administrative privileges.'
                            : 'Logged in as Standard User.',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF757575),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Navigation Actions Demonstration
                      Column(
                        children: [
                          // Push Fullscreen Dialog Action
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFF757575),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              icon: const Icon(Icons.open_in_new_rounded),
                              label: const Text('Open Detail (Fullscreen Dialog)'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => RoleDetailDialog(
                                      role: _selectedRole,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Push Replacement Route Action
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF757575),
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              icon: const Icon(Icons.person_pin_rounded),
                              label: const Text('Go to Main Profile'),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/profile');
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ] else ...[
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E0E0).withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Please click "Admin" or "User" above to see the welcome message.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF616161),
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Fullscreen Dialog Detail Screen
class RoleDetailDialog extends StatelessWidget {
  final String role;
  const RoleDetailDialog({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE0E0E0),
        elevation: 0,
        title: Text(
          '$role Details',
          style: const TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: Colors.black87),
          onPressed: () {
            // Navigator.pop example
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                role == 'Admin'
                    ? Icons.admin_panel_settings
                    : Icons.person,
                size: 80,
                color: const Color(0xFF757575),
              ),
              const SizedBox(height: 20),
              Text(
                role == 'Admin' ? 'Welcome Admin' : 'Welcome User',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'This screen was pushed with fullscreenDialog: true.',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF757575),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF757575),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back (Navigator.pop)'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
