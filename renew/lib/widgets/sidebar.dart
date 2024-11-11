import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 218, 240, 212), Color(0xFFF7FFF0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header Section
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 174, 217, 167),
                    Color.fromARGB(255, 218, 240, 212),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              accountName: Text(
                'Dhara Vadagasiya',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              accountEmail: Text(
                'Renewable Sector Enthusiast',
                style: TextStyle(color: Colors.black87),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.green,
                  size: 50,
                ),
              ),
            ),

            // Menu Items
            _buildMenuItem(
              icon: Icons.dashboard,
              title: 'Dashboard',
              onTap: () {
                // Navigate to Dashboard
              },
            ),
            _buildMenuItem(
              icon: Icons.business_center,
              title: 'Job Opportunities',
              onTap: () {
                // Navigate to Job Opportunities
              },
            ),
            _buildMenuItem(
              icon: Icons.deck,
              title: 'Deals',
              onTap: () {
                // Navigate to Deals
              },
            ),
            _buildMenuItem(
              icon: Icons.group,
              title: 'Business Network',
              onTap: () {
                // Navigate to Business Network
              },
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
              child: Divider(color: Colors.grey, thickness: 1),
            ),

            // Saved Posts and Logout in their own Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  _buildMenuItem(
                    icon: Icons.save,
                    title: 'Saved Posts',
                    onTap: () {
                      // Navigate to Saved Posts
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {
                      // Handle Logout
                    },
                  ),
                ],
              ),
            ),

            // Footer Section
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16),
              child: Column(
                children: [
                  const Text(
                    'Follow Us',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.facebook,
                      ),
                      SizedBox(width: 15),
                      FaIcon(
                        FontAwesomeIcons.linkedin,
                      ),
                      SizedBox(width: 15),
                      FaIcon(
                        FontAwesomeIcons.twitter,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 213, 212, 212),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Get in Touch',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'App Version: 1.0.0',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build menu items
  Widget _buildMenuItem(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}
