/// Model data post dari JSONPlaceholder.
class Post {
  /// Membuat objek post.
  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  /// Mengubah JSON API menjadi objek [Post].
  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: (json['userId'] as num?)?.toInt() ?? 0,
        id: (json['id'] as num?)?.toInt() ?? 0,
        title: json['title']?.toString() ?? '',
        body: json['body']?.toString() ?? '',
      );
}
