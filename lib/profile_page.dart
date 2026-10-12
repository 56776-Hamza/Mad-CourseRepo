import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7), // Light white/grey background
      appBar: AppBar(
        backgroundColor: const Color(0xFFE0E0E0), // Silver header
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: Colors.black87),
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
        ),
        title: const Text(
          'HAMZA RAHIM',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Profile Presentation Section
            Container(
              width: double.infinity,
              color: const Color(0xFFE0E0E0), // Silver background continuation
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        )
                      ]
                    ),
                    child: const CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Hamza Rahim',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Software Engineer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF757575), // Silver/Grey subtitle text
                    ),
                  ),
                ],
              ),
            ),

            // Information Body Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Info List
                  _buildInfoRow(Icons.email_outlined, 'Email', '56776@students.riphah.edu.pk'),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.business_outlined, 'University', 'Riphah International University'),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.school_outlined, 'Program', 'BS Software Engineering'),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.timeline_rounded, 'Semester', 'BSSE 7-1'),
                  
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 28.0),
                    child: Divider(color: Color(0xFFD6D6D6), thickness: 1),
                  ),
                  
                  const Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'I am a passionate Software Engineering student at Riphah International University, currently in my 7th semester (BSSE 7-1). I specialize in Mobile App Development using Flutter, Database Management Systems, Programming Fundamentals, and Website Development. I have a strong drive for creating clean, efficient, and user-friendly applications that deliver great user experiences. I enjoy solving complex logic problems, exploring modern technologies, and continuously improving my skills to become a highly proficient professional software engineer.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.7,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 32),
                  const Divider(color: Color(0xFFD6D6D6), thickness: 1),
                  const SizedBox(height: 24),

                  // Merged Interactive Widgets Section
                  const Text(
                    'Interactive Demo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Amber Container
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Animated Container Widget
                  Center(
                    child: const AnimatedContainerWidget(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF757575), size: 22),
        const SizedBox(width: 14),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 15, 
                color: Colors.black87, 
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Merged Animated Container Widget
class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState
    extends State<AnimatedContainerWidget> {
  double _height = 100;
  double _width = 100;

  void _increaseWidth() {
    setState(() {
      _height += 20;
      _width += 20;

      // Reset dimensions to prevent unlimited growth
      if (_width > 250) {
        _height = 100;
        _width = 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 5000),
      curve: Curves.easeInOut,
      color: Colors.blue,
      height: _height,
      width: _width,
      child: Center(
        child: FloatingActionButton(
          onPressed: _increaseWidth,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
