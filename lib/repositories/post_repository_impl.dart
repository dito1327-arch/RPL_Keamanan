import '../models/post.dart';
import '../services/api_service.dart';
import 'post_repository.dart';

/// Implementasi [PostRepository] menggunakan [ApiService].
class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<List<Post>> getPosts() => _apiService.getPosts();
}
