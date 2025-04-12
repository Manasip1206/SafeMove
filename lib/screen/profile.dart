import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SafeMovesProfile extends StatelessWidget {
  const SafeMovesProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF), // Light background color
      body: SingleChildScrollView(  // Make the body scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header Section
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.blue[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Manasi Parab', // Static Name
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Stay Safe, Stay Aligned!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Profile Options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  // Workout History
                  _buildProfileOption(
                    Icons.fitness_center,
                    'Workout History',
                    'View your progress',
                    onTap: () {
                      // Add Navigation or Functionality
                    },
                  ),

                  // Reminder
                  _buildProfileOption(
                    Icons.alarm,
                    'Reminders',
                    'Set workout alerts',
                    onTap: () {
                      // Add Navigation or Functionality
                    },
                  ),

                  // Safety Tips
                  _buildProfileOption(
                    Icons.health_and_safety,
                    'Safety Tips',
                    'Improve your alignment',
                    onTap: () {
                      // Add Navigation or Functionality
                    },
                  ),

                  // Terms & Conditions
                  _buildProfileOption(
                    Icons.article,
                    'Terms & Conditions',
                    'Read more',
                    onTap: () {
                      // Add Navigation or Functionality
                    },
                  ),

                  const SizedBox(height: 20),

                  // Social Media Links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(FontAwesomeIcons.facebook),
                      const SizedBox(width: 15),
                      _buildSocialIcon(FontAwesomeIcons.instagram),
                      const SizedBox(width: 15),
                      _buildSocialIcon(FontAwesomeIcons.twitter),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Profile Options
  Widget _buildProfileOption(IconData icon, String title, String subtitle,
      {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xFF6A11CB),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black45),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Social Media Icons
  Widget _buildSocialIcon(IconData icon) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      child: FaIcon(icon, color: Colors.blue, size: 20),
    );
  }
}
