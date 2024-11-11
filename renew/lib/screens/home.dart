import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:renew/widgets/footer_widget.dart';
import 'package:renew/widgets/header_widget.dart';
import 'package:renew/widgets/post1.dart';
import 'package:renew/widgets/post2.dart';
import 'package:renew/widgets/post3.dart';
import 'package:renew/widgets/sidebar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _scrollController;
  bool _isHeaderVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isHeaderVisible) {
        setState(() {
          _isHeaderVisible = false;
        });
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isHeaderVisible) {
        setState(() {
          _isHeaderVisible = true;
        });
      }
    }
  }

  void _onPostSwipe(String postId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
            postId: postId), // Navigate to the profile page with postId
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SidebarWidget(),
      body: Column(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _isHeaderVisible
                ? const HeaderWidget()
                : const SizedBox.shrink(),
          ),

          // Main scrollable content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  GestureDetector(
                    onHorizontalDragEnd: (details) {
                      if (details.primaryVelocity! < 0) {
                        _onPostSwipe("post1"); // Pass post1 ID
                      }
                    },
                    child: const Post1(),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onHorizontalDragEnd: (details) {
                      if (details.primaryVelocity! < 0) {
                        _onPostSwipe("post2"); // Pass post2 ID
                      }
                    },
                    child: const Post2(),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onHorizontalDragEnd: (details) {
                      if (details.primaryVelocity! < 0) {
                        _onPostSwipe("post3"); // Pass post3 ID
                      }
                    },
                    child: const Post3(),
                  ),
                ],
              ),
            ),
          ),

          // Footer section
          const FooterWidget(),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String postId;

  const ProfilePage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    // Display different content based on postId
    return Scaffold(
      appBar: AppBar(title: Text('Profile of $postId')),
      body: Center(
        child: _getProfileDetails(postId),
      ),
    );
  }

  Widget _getProfileDetails(String postId) {
    switch (postId) {
      case 'post1':
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100, color: Colors.blue),
            Text('Profile Details for Post 1', style: TextStyle(fontSize: 24)),
            // Add additional details for Post 1
          ],
        );
      case 'post2':
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100, color: Colors.green),
            Text('Profile Details for Post 2', style: TextStyle(fontSize: 24)),
            // Add additional details for Post 2
          ],
        );
      case 'post3':
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100, color: Colors.red),
            Text('Profile Details for Post 3', style: TextStyle(fontSize: 24)),
            // Add additional details for Post 3
          ],
        );
      default:
        return const Center(child: Text('No Profile Available'));
    }
  }
}
