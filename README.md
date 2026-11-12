# Praktikum Pemrograman Mobile – Pertemuan 6
## RPL & Keamanan Kode

Paket ini berisi implementasi Repository pattern, konfigurasi `flutter_dotenv`,
validasi dan sanitasi, dependency injection sederhana, logging terstruktur,
serta unit test untuk Validators.

### Menjalankan
1. Pastikan Flutter SDK dan Android device/emulator tersedia.
2. Salin folder `lib`, `test`, `pubspec.yaml`, `.env.example`, dan `.gitignore`
   ke proyek `secure_http` Anda (atau gunakan sebagai proyek sumber).
3. Buat `.env` di root proyek berdasarkan `.env.example`.
4. Jalankan:
   ```bash
   flutter pub get
   flutter test
   flutter run
   ```
5. Untuk memeriksa dokumentasi Dart:
   ```bash
   dart doc
   ```

### Catatan keamanan
- `.env` dikecualikan dari Git melalui `.gitignore`.
- Nilai API_KEY pada contoh hanya dummy. JSONPlaceholder tidak membutuhkan API key.
- File `.env` yang dimasukkan ke assets APK dapat diekstrak dari aplikasi. Karena itu,
  `.env` di aplikasi mobile bukan tempat aman untuk menyimpan secret produksi.
  Secret sebenarnya harus disimpan dan digunakan di backend.
- Validasi client membantu UX, tetapi validasi keamanan tetap wajib dilakukan di server.

### Git
```bash
git checkout -b fitur-rpl-keamanan
git add .
git commit -m "Refactoring ke Repository pattern, .env, dan validasi input"
```
