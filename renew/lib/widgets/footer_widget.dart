import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renew/screens/add.dart';
import 'package:renew/screens/home.dart';
import 'package:renew/screens/jobs.dart';
import 'package:renew/screens/meets.dart';
import 'package:renew/screens/network.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEAF4E7),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FooterIcon(icon: Icons.home_outlined, label: "Home", route: Home()),
          FooterIcon(icon: Icons.event, label: "Events", route: MeetingPage()),
          FooterIcon(
              icon: Icons.add_circle_outline,
              label: "Add Post",
              route: AddPage()),
          FooterIcon(
              icon: CupertinoIcons.globe,
              label: "Network",
              route: NetworkPage()),
          FooterIcon(
              icon: Icons.work_outline, label: "Jobs", route: JobsPage()),
        ],
      ),
    );
  }
}

class FooterIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget route;

  const FooterIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: Colors.green,
            size: 35,
          ),
          onPressed: () {
            // Navigate to the corresponding screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route),
            );
          },
        ),
        const SizedBox(height: 1),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
