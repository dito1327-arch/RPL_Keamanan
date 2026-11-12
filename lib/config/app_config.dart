import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Konfigurasi aplikasi yang dibaca dari file environment.
class AppConfig {
  /// Base URL REST API.
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';

  /// API key contoh; bukan secret produksi.
  static String get apiKey => dotenv.env['API_KEY'] ?? '';

  /// Batas waktu request dalam detik.
  static const int timeoutSeconds = 10;

  /// Memeriksa kelengkapan konfigurasi.
  static bool isConfigured() => baseUrl.isNotEmpty;
}
