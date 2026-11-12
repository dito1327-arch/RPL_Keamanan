import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../config/app_config.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../utils/app_logger.dart';

/// Service yang menangani komunikasi HTTP dengan REST API.
class ApiService {
  ApiService({http.Client? client, String? baseUrl})
      : _client = client ?? http.Client(),
        _baseUrl = baseUrl ?? AppConfig.baseUrl;

  final http.Client _client;
  final String _baseUrl;

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        if (AppConfig.apiKey.isNotEmpty) 'X-API-Key': AppConfig.apiKey,
      };

  /// Mengambil seluruh pengguna.
  Future<List<User>> getUsers() async {
    final data = await _getList('/users');
    return data.map((item) => User.fromJson(item)).toList();
  }

  /// Mengambil satu pengguna berdasarkan ID.
  Future<User> getUserById(int id) async {
    final data = await _getMap('/users/$id');
    return User.fromJson(data);
  }

  /// Mengambil seluruh post.
  Future<List<Post>> getPosts() async {
    final data = await _getList('/posts');
    return data.map((item) => Post.fromJson(item)).toList();
  }

  Future<List<Map<String, dynamic>>> _getList(String endpoint) async {
    final response = await _sendGet(endpoint);
    final decoded = jsonDecode(response.body);
    if (decoded is! List) throw const FormatException('Respons bukan daftar');
    return decoded.cast<Map<String, dynamic>>();
  }

  Future<Map<String, dynamic>> _getMap(String endpoint) async {
    final response = await _sendGet(endpoint);
    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Respons bukan objek');
    }
    return decoded;
  }

  Future<http.Response> _sendGet(String endpoint) async {
    try {
      AppLogger.debug('GET $endpoint');
      final response = await _client
          .get(Uri.parse('$_baseUrl$endpoint'), headers: _headers)
          .timeout(const Duration(seconds: AppConfig.timeoutSeconds));
      AppLogger.info('HTTP status ${response.statusCode}');
      if (response.statusCode != 200) {
        throw HttpException('Permintaan gagal (HTTP ${response.statusCode})');
      }
      return response;
    } on TimeoutException {
      throw Exception('Request timeout. Periksa koneksi internet Anda.');
    } on SocketException {
      throw Exception('Tidak ada koneksi internet. Periksa jaringan Anda.');
    } on FormatException {
      throw Exception('Format data dari server tidak valid.');
    }
  }

  /// Menutup HTTP client.
  void dispose() => _client.close();
}
