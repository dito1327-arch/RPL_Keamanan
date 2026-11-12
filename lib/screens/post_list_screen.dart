import 'package:flutter/material.dart';
import '../config/dependency_injector.dart';
import '../models/post.dart';
import '../repositories/post_repository.dart';
import '../widgets/post_card.dart';

/// Halaman daftar post yang menggunakan PostRepository.
class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key, this.repository});

  final PostRepository? repository;

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late final PostRepository _repository;
  List<Post> _posts = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _repository = widget.repository ?? DependencyInjector.postRepository;
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final result = await _repository.getPosts();
      if (!mounted) return;
      setState(() {
        _posts = result;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = 'Gagal memuat post. Periksa koneksi lalu coba lagi.';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Post'),
          actions: [
            IconButton(
              onPressed: _loadPosts,
              icon: const Icon(Icons.refresh),
              tooltip: 'Muat ulang',
            ),
          ],
        ),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(_error!),
                        ElevatedButton(
                          onPressed: _loadPosts,
                          child: const Text('Coba Lagi'),
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: _loadPosts,
                    child: ListView.builder(
                      itemCount: _posts.length,
                      itemBuilder: (_, index) => PostCard(post: _posts[index]),
                    ),
                  ),
      );
}
