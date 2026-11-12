import '../models/user.dart';

/// Kontrak operasi pengambilan data pengguna.
abstract class UserRepository {
  /// Mengambil seluruh pengguna.
  Future<List<User>> getUsers();

  /// Mengambil pengguna berdasarkan ID.
  Future<User> getUserById(int id);
}
