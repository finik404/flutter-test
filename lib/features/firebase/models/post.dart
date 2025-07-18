class PostModel {
  final String id;
  final String name;
  final String userId;
  final String? imageUrl;

  PostModel({
    required this.name,
    required this.id,
    required this.userId,
    this.imageUrl,
  });

  factory PostModel.fromJson(Map<String, dynamic> json, String id) {
    return PostModel(
      id: id,
      name: json['name'],
      userId: json['userId'],
      imageUrl: json['imageUrl'],
    );
  }
}
