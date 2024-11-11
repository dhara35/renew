import 'package:flutter/material.dart';
import 'package:renew/widgets/post.dart';

class ProfilePage extends StatelessWidget {
  final Post post;

  const ProfilePage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    // Display the profile and post details dynamically
    return Scaffold(
      appBar: AppBar(title: Text('Profile of ${post.profileName}')),
      body: Center(
        child: _getProfileDetails(post),
      ),
    );
  }

  Widget _getProfileDetails(Post post) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(post.profileImage),
        ),
        const SizedBox(height: 20),
        Text(post.profileName, style: const TextStyle(fontSize: 24)),
        Text('Posted: ${post.postTime}',
            style: const TextStyle(fontSize: 16, color: Colors.grey)),
        const SizedBox(height: 20),
        Text(post.caption, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 20),
        Text('Likes: ${post.likeCount}', style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        Text('Liked by: ${post.likedBy} and ${post.otherLikes} others',
            style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
