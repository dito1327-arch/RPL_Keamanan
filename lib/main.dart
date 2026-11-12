import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/app_config.dart';
import 'config/dependency_injector.dart';
import 'screens/home_screen.dart';
import 'utils/app_logger.dart';

/// Entry point aplikasi dan pemuatan konfigurasi.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  if (!AppConfig.isConfigured()) {
    AppLogger.warning('Konfigurasi belum lengkap. Periksa file .env.');
  }

  DependencyInjector.initialize();
  runApp(const SecureHttpApp());
}

/// Widget utama aplikasi praktikum.
class SecureHttpApp extends StatelessWidget {
  /// Membuat aplikasi utama.
  const SecureHttpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPL & Keamanan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
