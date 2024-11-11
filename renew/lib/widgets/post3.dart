import 'package:flutter/material.dart';
import 'postcard_widget.dart';

class Post3 extends StatelessWidget {
  const Post3({super.key});

  @override
  Widget build(BuildContext context) {
    return const PostCardWidget(
      profileName: 'Anjali Verma',
      profileImage: 'assets/profile.png',
      postTime: '6 hours ago',
      caption: 'Nature is the ultimate healer.',
      images: ['assets/post3.jpeg', 'assets/post1.png'],
      likedBy: 'solar_buzz',
      likeCount: '453',
      otherLikes: 'others',
    );
  }
}
