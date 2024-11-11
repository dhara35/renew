import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PostCardWidget extends StatefulWidget {
  final String profileImage;
  final String profileName;
  final String postTime;
  final String caption;
  final List<String> images;
  final String likedBy;
  final String likeCount;
  final String otherLikes;

  const PostCardWidget({
    super.key,
    required this.profileImage,
    required this.profileName,
    required this.postTime,
    required this.caption,
    required this.images,
    required this.likedBy,
    required this.likeCount,
    required this.otherLikes,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PostCardWidgetState createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  bool isLiked = false;
  bool isCaptionExpanded = false;
  int _currentImageIndex = 0;
  bool isFollowing = false;
  String? selectedReaction;
  bool isDoubleTapped = false; // Track double tap for like

  final List<Map<String, dynamic>> reactions = [
    {'icon': Icons.favorite, 'label': 'Like', 'color': Colors.red},
    {'icon': Icons.thumb_up_alt, 'label': 'Support', 'color': Colors.yellow},
    {'icon': Icons.lightbulb, 'label': 'Insightful', 'color': Colors.blue},
    {'icon': Icons.handshake, 'label': 'Appreciate', 'color': Colors.orange},
    {'icon': Icons.celebration, 'label': 'Celebrate', 'color': Colors.purple},
  ];

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  void showReactionPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        content: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: reactions.map((reaction) {
              return _reactionButton(
                reaction['icon'],
                reaction['label'],
                reaction['color'],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _reactionButton(IconData icon, String label, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedReaction = label; // Update the selected reaction
        });
        Navigator.pop(context); // Close the popup after selecting
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }

  // Handle double tap for like
  void onImageDoubleTap() {
    setState(() {
      isLiked = !isLiked;
      isDoubleTapped = true;
    });

    // Reset double-tap state after a short delay
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        isDoubleTapped = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: const Color(0xFFEAF4E7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with Profile Info, Follow Button, and Dropdown Menu
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(widget.profileImage),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.profileName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.postTime,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: toggleFollow,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color:
                          isFollowing ? Colors.white : const Color(0xFF23CE6B),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFF23CE6B),
                      ),
                    ),
                    child: Text(
                      isFollowing ? 'Following' : 'Follow',
                      style: TextStyle(
                        color: isFollowing
                            ? const Color(0xFF23CE6B)
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.bookmark),
                              title: const Text('Save'),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(CupertinoIcons.share),
                              title: const Text('Share via'),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Icons.visibility_off),
                              title: const Text('Not interested'),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Icons.person_remove),
                              title: Text('Unfollow ${widget.profileName}'),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Icons.flag),
                              title: const Text('Report post'),
                              onTap: () {},
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            // Caption Section with "Show more" functionality
            isCaptionExpanded
                ? RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.caption,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                : Text(
                    widget.caption.length > 50
                        ? "${widget.caption.substring(0, 50)}..." // Show first 50 characters
                        : widget
                            .caption, // Otherwise show the full caption if it's short
                    style: const TextStyle(color: Colors.black),
                  ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                setState(() {
                  isCaptionExpanded = !isCaptionExpanded;
                });
              },
              child: Text(isCaptionExpanded ? 'Show less' : 'Read more'),
            ),

            // Carousel Slider for Multiple Images with Double Tap Gesture
            GestureDetector(
              onDoubleTap: onImageDoubleTap,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CarouselSlider(
                    items: widget.images
                        .map((imagePath) => ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      height: 200,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentImageIndex = index;
                        });
                      },
                    ),
                  ),
                  // Display favorite icon if double tapped
                  if (isDoubleTapped)
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 50,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Dot Indicators for Carousel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => setState(() {
                    _currentImageIndex = entry.key;
                  }),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentImageIndex == entry.key
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),

            // Interaction Buttons Row (Like with Reactions, Comment, Repost, Send)
            Row(
              children: [
                GestureDetector(
                  onLongPress: () {
                    showReactionPopup(context);
                  },
                  onTap: () {
                    setState(() {
                      // If a reaction is selected, reset it and show the default "like" state
                      if (selectedReaction != null) {
                        selectedReaction = null; // Reset reaction
                      } else {
                        // If no reaction selected, toggle the like state
                        isLiked = !isLiked;
                      }
                    });
                  },
                  child: Row(
                    children: [
                      // If a reaction is selected, show that icon; otherwise, show the default like icon
                      Icon(
                        selectedReaction != null
                            ? reactions.firstWhere((reaction) =>
                                reaction['label'] == selectedReaction)['icon']
                            : (isLiked
                                ? Icons.favorite
                                : Icons
                                    .favorite_border), // Change icon based on like state
                        color: selectedReaction != null
                            ? reactions.firstWhere((reaction) =>
                                reaction['label'] == selectedReaction)['color']
                            : (isLiked
                                ? Colors.red
                                : Colors
                                    .grey), // Change color based on selection
                      ),
                      const SizedBox(width: 3),
                      Text(
                        selectedReaction != null
                            ? selectedReaction! // Display selected reaction text
                            : (isLiked
                                ? 'Liked'
                                : 'Like'), // Toggle text based on selection
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    // Handle comment button press
                  },
                  child: const Row(
                    children: [
                      Icon(CupertinoIcons.chat_bubble,
                          color: Colors.grey, size: 20),
                      SizedBox(width: 3),
                      Text('Comment',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    // Handle repost button press
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.repeat, color: Colors.grey, size: 20),
                      SizedBox(width: 3),
                      Text('Repost',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    // Handle send button press
                  },
                  child: const Row(
                    children: [
                      Icon(CupertinoIcons.paperplane,
                          color: Colors.grey, size: 20),
                      SizedBox(width: 4),
                      Text('Send',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(
              color: Colors.grey, // Set divider color to grey
              thickness: 1,
            ),

            // Like Count Section (Dynamic Version)
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Liked by ',
                    style: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
                  ),
                  TextSpan(
                    text: widget.likedBy, // Variable for the user who liked
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' and ${widget.likeCount} others', // Variable for like count
                    style: const TextStyle(
                      color: Color.fromARGB(255, 12, 12, 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
