class Post {
  final String postId;
  final String profileImage;
  final String profileName;
  final String postTime;
  final String caption;
  final List<String> images;
  final String likedBy;
  final String likeCount;
  final String otherLikes;

  Post({
    required this.postId,
    required this.profileImage,
    required this.profileName,
    required this.postTime,
    required this.caption,
    required this.images,
    required this.likedBy,
    required this.likeCount,
    required this.otherLikes,
  });
}
