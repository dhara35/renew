import 'package:flutter/material.dart';
import 'package:renew/screens/add.dart';
import 'package:renew/screens/home.dart';
import 'package:renew/screens/jobs.dart';
import 'package:renew/screens/meets.dart';
import 'package:renew/screens/network.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Renewe', // Fixed typo in the title
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: _buildAppRoutes(),
    );
  }

  // Function to define routes
  Map<String, WidgetBuilder> _buildAppRoutes() {
    return {
      '/': (context) => const Home(),
      '/meets': (context) => const MeetingPage(),
      '/jobs': (context) => const JobsPage(),
      '/network': (context) => const NetworkPage(),
      '/add': (context) => const AddPage(),
    };
  }
}
