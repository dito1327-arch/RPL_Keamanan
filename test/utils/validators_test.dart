import 'package:flutter_test/flutter_test.dart';
import 'package:secure_http/utils/validators.dart';

void main() {
  group('Validators.isValidEmail', () {
    test('menerima email valid', () {
      expect(Validators.isValidEmail('mahasiswa@example.com'), isTrue);
    });

    test('menolak email tidak valid', () {
      expect(Validators.isValidEmail('email-tidak-valid'), isFalse);
      expect(Validators.isValidEmail('a@b'), isFalse);
    });
  });

  group('Validators.sanitize', () {
    test('mengubah karakter HTML khusus menjadi entity', () {
      expect(
        Validators.sanitize("<script>alert('x')</script>"),
        '&lt;script&gt;alert(&#39;x&#39;)&lt;/script&gt;',
      );
    });

    test('melakukan trim', () {
      expect(Validators.sanitize('  aman  '), 'aman');
    });
  });

  group('Validators.validateText', () {
    test('menolak teks kosong', () {
      expect(Validators.validateText('  '), isNotNull);
    });

    test('menerima teks dalam rentang', () {
      expect(Validators.validateText('Catur', minLength: 2, maxLength: 10),
          isNull);
    });

    test('menolak teks terlalu panjang', () {
      expect(Validators.validateText('abcdefgh', maxLength: 5), isNotNull);
    });
  });

  group('Validasi tambahan', () {
    test('nomor telepon 10-13 digit', () {
      expect(Validators.validatePhone('081234567890'), isNull);
      expect(Validators.validatePhone('12345'), isNotNull);
      expect(Validators.validatePhone('08123abc890'), isNotNull);
    });

    test('URL harus http atau https', () {
      expect(Validators.validateUrl('https://example.com'), isNull);
      expect(Validators.validateUrl('ftp://example.com'), isNotNull);
    });

    test('password memiliki syarat kompleksitas', () {
      expect(Validators.validatePassword('Aman123!'), isNull);
      expect(Validators.validatePassword('password'), isNotNull);
    });
  });
}
