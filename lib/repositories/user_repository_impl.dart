import '../models/user.dart';
import '../services/api_service.dart';
import 'user_repository.dart';

/// Implementasi [UserRepository] menggunakan [ApiService].
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<List<User>> getUsers() => _apiService.getUsers();

  @override
  Future<User> getUserById(int id) => _apiService.getUserById(id);
}
