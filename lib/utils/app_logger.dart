import 'package:flutter/foundation.dart';

/// Logger terstruktur yang hanya aktif pada mode debug.
class AppLogger {
  AppLogger._();

  /// Mencatat pesan debug.
  static void debug(String message) => _write('DEBUG', message);

  /// Mencatat pesan informasi.
  static void info(String message) => _write('INFO', message);

  /// Mencatat peringatan.
  static void warning(String message) => _write('WARNING', message);

  /// Mencatat kesalahan tanpa data sensitif.
  static void error(String message) => _write('ERROR', message);

  static void _write(String level, String message) {
    if (kDebugMode) {
      debugPrint('[$level] $message');
    }
  }
}
