import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:renew/screens/profilepage.dart';

import 'package:renew/widgets/footer_widget.dart';
import 'package:renew/widgets/header_widget.dart';
import 'package:renew/widgets/post.dart';
import 'package:renew/widgets/postcard_widget.dart';
import 'package:renew/widgets/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late ScrollController _scrollController;
  bool _isHeaderVisible = true;

  final List<Post> posts = [
    Post(
      postId: '1',
      profileImage: 'assets/profile.png',
      profileName: 'Navin Patil',
      postTime: '3 hours ago',
      caption:
          "AsiaOne Magazine is thrilled to announce that Gruner Renewable Energy will be felicitated with the Indias Fastest Growing Sustainable Brands 2023-24 award! Established in February 2023, Gruner Renewable Energy has swiftly emerged as a premier provider of sustainable energy solutions, dedicated to reducing carbon footprints and realizing sustainability objectives. Leveraging advanced technology from Germany, their expertise lies in offering end-to-end solutions that encompass the entire plant setup process. Additionally, Gruner Renewable excels in the installation of top-tier Biogas plants, known for their affordability and user-friendliness, Headquartered in Noida. Gruner Renewable Energy is paving the way for a greener and more sustainable future where renewable energy sources play a pivotal role in mitigating environmental impact. This award is a testament to the hard work and dedication of the Gruner Renewable Energy team. Join us in congratulating Gruner Renewable Energy on this incredible achievement",
      images: ['assets/post1.png', 'assets/post2.jpeg', 'assets/post3.jpeg'],
      likedBy: 'waree_energies',
      likeCount: '23',
      otherLikes: 'others',
    ),
    Post(
      postId: '2',
      profileImage: 'assets/profile.png',
      profileName: 'Anita Verma',
      postTime: '5 hours ago',
      caption: 'Exciting news from Gruner Renewable Energy...',
      images: ['assets/post2.jpeg', 'assets/post3.jpeg'],
      likedBy: 'green_earth',
      likeCount: '45',
      otherLikes: 'others',
    ),
    Post(
      postId: '3',
      profileImage: 'assets/profile.png',
      profileName: 'Rajesh Kumar',
      postTime: '1 day ago',
      caption: 'Gruner Renewable Energy is making strides...',
      images: ['assets/post3.jpeg', 'assets/post1.png'],
      likedBy: 'eco_world',
      likeCount: '67',
      otherLikes: 'others',
    ),
  ];

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

  void _onPostSwipe(Post post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(post: post),
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
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity! < 0) {
                      _onPostSwipe(post); // Pass post data
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: PostCardWidget(
                      profileImage: post.profileImage,
                      profileName: post.profileName,
                      postTime: post.postTime,
                      caption: post.caption,
                      images: post.images,
                      likedBy: post.likedBy,
                      likeCount: post.likeCount,
                      otherLikes: post.otherLikes,
                    ),
                  ),
                );
              },
            ),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}
