import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/routes/named_routes.dart';
import 'package:messenger/shared/widgets/custom_appbar.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        customTitle: IconButton(
          onPressed: () {
            context.push(NamedRoutes.myQR);
          },
          icon: Icon(Icons.qr_code),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: '',
                child: Row(
                  children: [
                    Icon(Icons.color_lens_outlined),
                    Text('Change profile color'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: '',
                child: Row(
                  children: [
                    Icon(Icons.alternate_email),
                    Text('Change username'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: '',
                child: Row(
                  children: [Icon(Icons.link), Text('Copy link to profile')],
                ),
              ),
            ],
          ),
        ],
      ),

      body: ListView(
        children: [
          const SizedBox(height: 24),

          // Avatar
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 55),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          const Center(
            child: Text(
              'Rishabh',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ),

          const SizedBox(height: 4),

          Center(
            child: Text(
              'last seen recently',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),

          const SizedBox(height: 24),

          const Divider(),

          _profileTile(
            icon: Icons.phone_outlined,
            title: 'Phone',
            subtitle: '+91 9876543210',
            onTap: () {},
          ),

          _profileTile(
            icon: Icons.alternate_email,
            title: 'Username',
            subtitle: '@rishabvsnv',
            onTap: () {},
          ),

          _profileTile(
            icon: Icons.info_outline,
            title: 'Bio',
            subtitle: 'Flutter Developer',
            onTap: () {},
          ),

          const Divider(),

          _profileTile(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            subtitle: 'Enabled',
            onTap: () {},
          ),

          _profileTile(
            icon: Icons.lock_outline,
            title: 'Privacy & Security',
            subtitle: 'Manage account privacy',
            onTap: () {
              context.push(NamedRoutes.privacy);
            },
          ),

          _profileTile(
            icon: Icons.devices_outlined,
            title: 'Devices',
            subtitle: 'Manage active sessions',
            onTap: () {
              context.push(NamedRoutes.devices);
            },
          ),

          const Divider(),

          _profileTile(
            icon: Icons.photo_library_outlined,
            title: 'Shared Media',
            subtitle: 'Photos, videos and files',
            onTap: () {},
          ),

          _profileTile(
            icon: Icons.folder_outlined,
            title: 'Chat Folders',
            subtitle: 'Organize conversations',
            onTap: () {
              context.push(NamedRoutes.folders);
            },
          ),

          const Divider(),

          _profileTile(
            icon: Icons.star_outline,
            title: 'Telegram Premium',
            subtitle: 'Unlock additional features',
            onTap: () {},
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Colors.red),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
            ),
            onTap: () {},
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  static Widget _profileTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}
