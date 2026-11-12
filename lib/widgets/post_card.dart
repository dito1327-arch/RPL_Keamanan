import 'package:flutter/material.dart';
import '../models/post.dart';

/// Kartu ringkas informasi post.
class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: ListTile(
          leading: CircleAvatar(child: Text(post.id.toString())),
          title: Text(post.title, maxLines: 2, overflow: TextOverflow.ellipsis),
          subtitle:
              Text(post.body, maxLines: 3, overflow: TextOverflow.ellipsis),
        ),
      );
}
