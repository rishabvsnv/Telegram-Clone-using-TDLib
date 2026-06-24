import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/routes/named_routes.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const SizedBox(height: 12),

          // Profile Section
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  child: Icon(Icons.person, size: 32),
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Rishabh',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '+91 9876543210',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {
                    context.push(NamedRoutes.myQR);
                  },
                  icon: const Icon(Icons.qr_code_rounded),
                ),
              ],
            ),
          ),

          const Divider(),

          _sectionTitle('Account'),

          _settingsTile(
            icon: Icons.person_outline,
            title: 'Edit Profile',
            subtitle: 'Name, bio, profile photo',
            onTap: () {},
          ),

          _settingsTile(
            icon: Icons.alternate_email,
            title: 'Username',
            subtitle: '@rishabvsnv',
            onTap: () {},
          ),

          _settingsTile(
            icon: Icons.phone_outlined,
            title: 'Phone Number',
            subtitle: '+91 9876543210',
            onTap: () {},
          ),

          const Divider(),

          _sectionTitle('Preferences'),

          _settingsTile(
            icon: Icons.notifications_none,
            title: 'Notifications',
            onTap: () {
              context.push(NamedRoutes.notifications);
            },
          ),

          _settingsTile(
            icon: Icons.lock_outline,
            title: 'Privacy & Security',
            onTap: () {
              context.push(NamedRoutes.privacy);
            },
          ),

          _settingsTile(
            icon: Icons.chat_bubble_outline,
            title: 'Chat Settings',
            onTap: () {
              // context.push(NamedRoutes.);
            },
          ),

          _settingsTile(
            icon: Icons.palette_outlined,
            title: 'Appearance',
            onTap: () {
              context.push(NamedRoutes.appearance);
            },
          ),

          _settingsTile(
            icon: Icons.language_outlined,
            title: 'Language',
            onTap: () {
              context.push(NamedRoutes.language);
            },
          ),

          const Divider(),

          _sectionTitle('Data & Storage'),

          _settingsTile(
            icon: Icons.storage_outlined,
            title: 'Storage Usage',
            onTap: () {
              context.push(NamedRoutes.storage);
            },
          ),

          _settingsTile(
            icon: Icons.network_check_outlined,
            title: 'Data Usage',
            onTap: () {
              context.push(NamedRoutes.dataUsage);
            },
          ),

          _settingsTile(
            icon: Icons.download_outlined,
            title: 'Auto Download Media',
            onTap: () {},
          ),

          const Divider(),

          _sectionTitle('Advanced'),

          _settingsTile(
            icon: Icons.devices_outlined,
            title: 'Devices',
            onTap: () {
              context.push(NamedRoutes.devices);
            },
          ),

          _settingsTile(
            icon: Icons.folder_outlined,
            title: 'Chat Folders',
            onTap: () {
              context.push(NamedRoutes.folders);
            },
          ),

          const Divider(),

          _sectionTitle('Help'),

          _settingsTile(icon: Icons.help_outline, title: 'FAQ', onTap: () {}),

          _settingsTile(
            icon: Icons.support_agent_outlined,
            title: 'Ask a Question',
            onTap: () {},
          ),

          _settingsTile(icon: Icons.info_outline, title: 'About', onTap: () {}),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Colors.red),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              context.push(NamedRoutes.login);
            },
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  static Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Text(
        title,
        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
      ),
    );
  }

  static Widget _settingsTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}
