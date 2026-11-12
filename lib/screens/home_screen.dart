import 'package:flutter/material.dart';
import 'post_list_screen.dart';
import 'user_list_screen.dart';

/// Beranda untuk memilih fitur daftar pengguna atau post.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('RPL & Keamanan Kode'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Icon(Icons.security, size: 72),
            const SizedBox(height: 12),
            const Text(
              'Praktikum Pemrograman Mobile – Pertemuan 6',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Daftar Pengguna'),
                subtitle: const Text('Data pengguna dari REST API'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const UserListScreen()),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.article),
                title: const Text('Daftar Post'),
                subtitle: const Text('Latihan Repository untuk Post'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PostListScreen()),
                ),
              ),
            ),
          ],
        ),
      );
}
