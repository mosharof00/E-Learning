class User {
  final int id;
  final String name;
  final String imageUrl;
  final String? userClass;
  final String lastMessage;
  final String time;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.userClass,
    required this.lastMessage,
    required this.time,
  });
}