/// Model data pengguna dari JSONPlaceholder.
class User {
  /// Membuat objek pengguna.
  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.phone = '',
    this.website = '',
    this.companyName = '',
  });

  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String companyName;

  /// Mengubah JSON API menjadi objek [User].
  factory User.fromJson(Map<String, dynamic> json) {
    final company = json['company'];
    return User(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? '',
      username: json['username']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      website: json['website']?.toString() ?? '',
      companyName: company is Map ? (company['name']?.toString() ?? '') : '',
    );
  }
}
