import 'package:flutter/material.dart';
import 'package:renew/widgets/postcard_widget.dart';

class Post2 extends StatelessWidget {
  const Post2({super.key});

  @override
  Widget build(BuildContext context) {
    return const PostCardWidget(
      profileName: 'Ravi Sharma',
      profileImage: 'assets/profile.png',
      postTime: '5 hours ago',
      caption: 'Exploring the wonders of the universe!',
      images: ['assets/post2.jpeg', 'assets/post3.jpeg'],
      likedBy: 'renewe',
      likeCount: '23',
      otherLikes: 'others',
    );
  }
}
