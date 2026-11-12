import '../repositories/post_repository.dart';
import '../repositories/post_repository_impl.dart';
import '../repositories/user_repository.dart';
import '../repositories/user_repository_impl.dart';
import '../services/api_service.dart';

/// Penyedia dependency sederhana dengan satu instance ApiService.
class DependencyInjector {
  DependencyInjector._();

  static ApiService? _apiService;
  static UserRepository? _userRepository;
  static PostRepository? _postRepository;

  /// Membuat dependency aplikasi satu kali.
  static void initialize() {
    _apiService ??= ApiService();
    _userRepository ??= UserRepositoryImpl(_apiService!);
    _postRepository ??= PostRepositoryImpl(_apiService!);
  }

  /// Repository pengguna.
  static UserRepository get userRepository {
    initialize();
    return _userRepository!;
  }

  /// Repository post.
  static PostRepository get postRepository {
    initialize();
    return _postRepository!;
  }

  /// Menutup resource saat aplikasi tidak lagi menggunakannya.
  static void dispose() {
    _apiService?.dispose();
    _apiService = null;
    _userRepository = null;
    _postRepository = null;
  }
}
