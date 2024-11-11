import 'package:flutter/material.dart';
import 'postcard_widget.dart';

class Post1 extends StatelessWidget {
  const Post1({super.key});

  @override
  Widget build(BuildContext context) {
    return const PostCardWidget(
      profileImage: 'assets/profile.png',
      profileName: 'Navin Patil',
      postTime: '3 hours ago',
      caption:
          'AsiaOne Magazine is thrilled to announce that Gruner Renewable Energy will be felicitated with the Indias Fastest Growing Sustainable Brands 2023-24 award! Established in February 2023, Gruner Renewable Energy has swiftly emerged as a premier provider of sustainable energy solutions, dedicated to reducing carbon footprints and realizing sustainability objectives. Leveraging advanced technology from Germany, their expertise lies in offering end-to-end solutions that encompass the entire plant setup process. Additionally, Gruner Renewable excels in the installation of top-tier Biogas plants, known for their affordability and user-friendliness, Headquartered in Noida. Gruner Renewable Energy is paving the way for a greener and more sustainable future where renewable energy sources play a pivotal role in mitigating environmental impact. This award is a testament to the hard work and dedication of the Gruner Renewable Energy team. Join us in congratulating Gruner Renewable Energy on this incredible achievement',
      images: ['assets/post1.png', 'assets/post2.jpeg', 'assets/post3.jpeg'],
      likedBy: 'waree_energies',
      likeCount: '23',
      otherLikes: 'others',
    );
  }
}
