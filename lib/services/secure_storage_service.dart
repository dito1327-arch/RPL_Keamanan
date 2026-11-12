import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Layanan pembungkus penyimpanan key-value yang terenkripsi.
class SecureStorageService {
  SecureStorageService({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  /// Menyimpan nilai dengan kunci tertentu.
  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);

  /// Membaca nilai berdasarkan kunci.
  Future<String?> read(String key) => _storage.read(key: key);

  /// Menghapus nilai berdasarkan kunci.
  Future<void> delete(String key) => _storage.delete(key: key);

  /// Menghapus seluruh data yang tersimpan oleh layanan ini.
  Future<void> deleteAll() => _storage.deleteAll();
}
