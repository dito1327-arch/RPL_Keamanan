import 'package:flutter/material.dart';
import '../models/user.dart';

/// Kartu ringkas informasi pengguna.
class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user, this.onTap});

  final User user;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: ListTile(
          leading: CircleAvatar(child: Text(user.id.toString())),
          title: Text(user.name),
          subtitle: Text(user.email),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      );
}
