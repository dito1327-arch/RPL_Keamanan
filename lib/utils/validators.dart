/// Kumpulan fungsi validasi dan sanitasi input pengguna.
class Validators {
  /// Memeriksa format email secara dasar.
  static bool isValidEmail(String email) {
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email.trim());
  }

  /// Memeriksa apakah teks tidak kosong.
  static bool isNotEmpty(String? value) =>
      value != null && value.trim().isNotEmpty;

  /// Memeriksa panjang teks setelah spasi tepi diabaikan.
  static bool hasValidLength(String value, {int min = 1, int max = 100}) {
    final length = value.trim().length;
    return length >= min && length <= max;
  }

  /// Meng-encode karakter HTML khusus agar tidak ditafsirkan sebagai markup.
  static String sanitize(String input) {
    return input
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;')
        .trim();
  }

  /// Memvalidasi teks dan mengembalikan pesan kesalahan jika tidak valid.
  static String? validateText(
    String? value, {
    String fieldName = 'Field',
    int minLength = 1,
    int maxLength = 100,
  }) {
    if (!isNotEmpty(value)) return '$fieldName tidak boleh kosong';
    if (!hasValidLength(value!, min: minLength, max: maxLength)) {
      return '$fieldName harus antara $minLength-$maxLength karakter';
    }
    return null;
  }

  /// Memvalidasi email dan mengembalikan pesan kesalahan jika tidak valid.
  static String? validateEmail(String? value) {
    if (!isNotEmpty(value)) return 'Email tidak boleh kosong';
    if (!isValidEmail(value!)) return 'Format email tidak valid';
    return null;
  }

  /// Nomor telepon hanya boleh berisi 10–13 digit.
  static String? validatePhone(String? value) {
    if (!isNotEmpty(value)) return 'Nomor telepon tidak boleh kosong';
    if (!RegExp(r'^\d{10,13}$').hasMatch(value!.trim())) {
      return 'Nomor telepon harus terdiri dari 10-13 digit angka';
    }
    return null;
  }

  /// URL harus diawali dengan http:// atau https:// dan memiliki host.
  static String? validateUrl(String? value) {
    if (!isNotEmpty(value)) return 'URL tidak boleh kosong';
    final uri = Uri.tryParse(value!.trim());
    if (uri == null ||
        !{'http', 'https'}.contains(uri.scheme) ||
        uri.host.isEmpty) {
      return 'URL harus diawali http:// atau https://';
    }
    return null;
  }

  /// Password minimal 8 karakter dengan kapital, angka, dan simbol.
  static String? validatePassword(String? value) {
    if (!isNotEmpty(value)) return 'Password tidak boleh kosong';
    final password = value!;
    if (password.length < 8 ||
        !RegExp(r'[A-Z]').hasMatch(password) ||
        !RegExp(r'\d').hasMatch(password) ||
        !RegExp(r'[^A-Za-z0-9]').hasMatch(password)) {
      return 'Password minimal 8 karakter, berisi huruf kapital, angka, dan simbol';
    }
    return null;
  }
}
