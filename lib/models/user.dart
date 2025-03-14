class User {
  final String name;
  final String image;
  final String role;
  final int posts;
  final int followers;
  final int following;
  final String about;
  final List<String> skills;

  const User({
    required this.name,
    required this.image,
    required this.role,
    required this.posts,
    required this.followers,
    required this.following,
    required this.about,
    required this.skills,
  });
}
