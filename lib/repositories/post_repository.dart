import '../models/post.dart';

/// Kontrak operasi pengambilan data post.
abstract class PostRepository {
  /// Mengambil seluruh post.
  Future<List<Post>> getPosts();
}
