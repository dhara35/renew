import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header section
        Container(
          color: const Color(0xFFEAF4E7),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Sidebar toggle button
              Builder(
                builder: (context) => IconButton(
                  icon: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.green[200],
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              Image.asset(
                'assets/renewe-logo.png',
                height: 24,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.notifications,
                    color: Colors.green,
                    size: 30,
                  ),
                  SizedBox(width: 16),
                  Icon(
                    Icons.near_me_sharp,
                    color: Colors.green,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
        ),

        // Search bar section
        Container(
          color: const Color(0xFFEAF4E7),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.green,
                ),
                SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for people, jobs, companies',
                      hintStyle: TextStyle(color: Colors.green),
                      border: InputBorder.none,
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
