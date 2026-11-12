import 'package:flutter_test/flutter_test.dart';
import 'package:secure_http/main.dart';

void main() {
  testWidgets('aplikasi menampilkan beranda praktikum', (tester) async {
    // Uji widget tidak menjalankan main() agar tidak membutuhkan file .env.
    await tester.pumpWidget(const SecureHttpApp());
    expect(find.text('RPL & Keamanan Kode'), findsOneWidget);
    expect(find.text('Daftar Pengguna'), findsOneWidget);
  });
}
