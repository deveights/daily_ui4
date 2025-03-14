import 'package:daily_ui4/models/post.dart';
import 'package:daily_ui4/models/user.dart';

final User user = User(
  name: 'Jon Bellion',
  image: 'assets/dp.jpg',
  role: 'Singer-Songwriter, Producer',
  posts: 250,
  followers: 1000000,
  following: 200,
  about:
      "Jon Bellion is an American singer, songwriter, and producer known for his unique sound blending hip-hop, R&B, and pop. He is best known for hits like 'All Time Low' and his work on 'Glory Sound Prep.'",
  skills: ["Singing", "Songwriting", "Producing", "Rapping", "Composing"],
);

final List<Post> posts = [
  Post(
    name: "Jon Bellion",
    datePosted: '2 Weeks Ago',
    image: 'assets/glory.jpg',
  ),
  Post(
    name: "Jon Bellion",
    datePosted: '4 Weeks Ago',
    image: 'assets/human.png',
  ),
  Post(name: "Jon Bellion", datePosted: '7 Weeks Ago', image: 'assets/idk.jpg'),
];

Post mapPosts() {
  final Post post = posts.map((post) => post) as Post;

  return post;
}
