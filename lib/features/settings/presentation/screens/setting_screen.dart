import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/routes/named_routes.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: false,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 12),
                    Text('Log Out'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'logout') {
                context.go(NamedRoutes.login);
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 24),

            // Avatar
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primaryContainer,
                        child: const Text(
                          'R',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          child: Icon(
                            Icons.camera_alt,
                            size: 14,
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Rishabh',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '+91 XXX XXX XXXX',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'last seen recently',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),

                  const SizedBox(height: 4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit'),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.qr_code),
                        label: const Text('QR'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 6),
              child: Text(
                'SETTINGS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                  letterSpacing: 1,
                ),
              ),
            ),

            SettingsSection(
              children: [
                _profileTile(
                  icon: Icons.person,
                  title: 'Account',
                  subtitle: 'Number, Username, Bio',
                  onTap: () {},
                ),
                const Divider(height: 1),

                _profileTile(
                  icon: Icons.shield_outlined,
                  title: 'Privacy & Security',
                  subtitle: 'Last Seen, Devices, Passkeys',
                  onTap: () {},
                ),
                const Divider(height: 1),

                _profileTile(
                  icon: Icons.storage_outlined,
                  title: 'Data and Storage',
                  subtitle: 'Media download settings',
                  onTap: () {
                    context.push(NamedRoutes.storage);
                  },
                ),

                const Divider(height: 1),

                _profileTile(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  subtitle: 'Sound, Calls, Badges',
                  onTap: () {
                    context.push(NamedRoutes.notifications);
                  },
                ),

                const Divider(height: 1),

                _profileTile(
                  icon: Icons.lock_outline,
                  title: 'Devices',
                  subtitle: 'Manage connected devices',
                  onTap: () {
                    context.push(NamedRoutes.devices);
                  },
                ),

                const Divider(height: 1),

                _profileTile(
                  icon: Icons.lock_outline,
                  title: 'Power Saving',
                  subtitle: 'Reduce power usage on low charge',
                  onTap: () {
                    // context.push(NamedRoutes.);
                  },
                ),
              ],
            ),

            SettingsSection(
              children: [
                _profileTile(
                  icon: Icons.chat_bubble_outline,
                  title: 'Chat Settings',
                  subtitle: 'Wallpaper, Night Mode, Animations',
                  onTap: () {},
                ),
                const Divider(height: 1),

                _profileTile(
                  icon: Icons.folder_outlined,
                  title: 'Chat Folders',
                  subtitle: 'Sort chats into folders',
                  onTap: () {
                    context.push(NamedRoutes.folders);
                  },
                ),
                const Divider(height: 1),

                _profileTile(
                  icon: Icons.language,
                  title: 'Language',
                  subtitle: 'English',
                  onTap: () {
                    context.push(NamedRoutes.language);
                  },
                ),
              ],
            ),

            SettingsSection(
              children: [
                _profileTile(
                  icon: Icons.workspace_premium_outlined,
                  title: 'Telegram Premium',
                  onTap: () {},
                ),
                const Divider(height: 1),

                _profileTile(
                  icon: Icons.stars_outlined,
                  title: 'Telegram Stars',
                  onTap: () {},
                ),
                const Divider(height: 1),

                _profileTile(
                  icon: Icons.business_center_outlined,
                  title: 'Telegram Business',
                  onTap: () {},
                ),
                const Divider(height: 1),

                _profileTile(
                  icon: Icons.card_giftcard_outlined,
                  title: 'Send a Gift',
                  onTap: () {},
                ),
              ],
            ),

            SettingsSection(
              children: [
                _profileTile(
                  icon: Icons.help_outline,
                  title: 'Ask a Question',
                  onTap: () {},
                ),
                const Divider(height: 1),

                _profileTile(
                  icon: Icons.quiz_outlined,
                  title: 'Telegram FAQ',
                  onTap: () {},
                ),
                const Divider(height: 1),

                _profileTile(
                  icon: Icons.auto_awesome_outlined,
                  title: 'Telegram Features',
                  onTap: () {
                    context.push(NamedRoutes.telegramFeatures);
                  },
                ),
                const Divider(height: 1),

                _profileTile(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  onTap: () {
                    context.push(NamedRoutes.privacy);
                  },
                ),
              ],
            ),

            Center(child: Text('Telegram for Android v12.8.3 (6922)')),
            Center(child: Text('store bundled arm64-v8a')),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  static Widget _profileTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      dense: true,
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right, size: 18),
      onTap: onTap,
    );
  }
}

class SettingsSection extends StatelessWidget {
  final List<Widget> children;

  const SettingsSection({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Theme.of(context).cardColor,
          child: Column(children: children),
        ),
      ),
    );
  }
}
