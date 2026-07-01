import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.qr_code_2_rounded),
              ),
              PopupMenuButton<String>(
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit_outlined),
                        SizedBox(width: 12),
                        Text('Edit Profile'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'share',
                    child: Row(
                      children: [
                        Icon(Icons.share_outlined),
                        SizedBox(width: 12),
                        Text('Share Profile'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'settings',
                    child: Row(
                      children: [
                        Icon(Icons.settings_outlined),
                        SizedBox(width: 12),
                        Text('Settings'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              background: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          child: Icon(Icons.person, size: 56),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Rishabh',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '@rishabh',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('Online', style: TextStyle(color: Colors.green)),
                  ],
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_outlined),
                  label: const Text('Edit Profile'),
                ),

                const SizedBox(height: 16),

                _SectionCard(
                  title: 'About',
                  child: Text(
                    'Flutter Developer • Building modern mobile applications and scalable software solutions.',
                    style: TextStyle(color: Colors.grey.shade700, height: 1.5),
                  ),
                ),

                const SizedBox(height: 16),

                _SectionCard(
                  title: 'Contact Information',
                  child: Column(
                    children: const [
                      _InfoTile(
                        icon: Icons.phone_outlined,
                        title: '+91 9876543210',
                        subtitle: 'Phone Number',
                      ),
                      Divider(height: 1),
                      _InfoTile(
                        icon: Icons.alternate_email,
                        title: '@rishabh',
                        subtitle: 'Username',
                      ),
                      Divider(height: 1),
                      _InfoTile(
                        icon: Icons.email_outlined,
                        title: 'rishabh@example.com',
                        subtitle: 'Email',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                _SectionCard(
                  title: 'Media',
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.2,
                    children: const [
                      _StatTile(
                        icon: Icons.photo_library_outlined,
                        title: 'Photos',
                        count: '120',
                      ),
                      _StatTile(
                        icon: Icons.videocam_outlined,
                        title: 'Videos',
                        count: '45',
                      ),
                      _StatTile(
                        icon: Icons.insert_drive_file_outlined,
                        title: 'Files',
                        count: '18',
                      ),
                      _StatTile(
                        icon: Icons.link_outlined,
                        title: 'Links',
                        count: '34',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                _SectionCard(
                  title: 'Settings',
                  child: Column(
                    children: const [
                      _SettingsTile(icon: Icons.lock_outline, title: 'Privacy'),
                      Divider(height: 1),
                      _SettingsTile(
                        icon: Icons.notifications_outlined,
                        title: 'Notifications',
                      ),
                      Divider(height: 1),
                      _SettingsTile(
                        icon: Icons.palette_outlined,
                        title: 'Appearance',
                      ),
                      Divider(height: 1),
                      _SettingsTile(
                        icon: Icons.devices_outlined,
                        title: 'Connected Devices',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.logout, color: Colors.red.shade600),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.red.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SettingsTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String count;

  const _StatTile({
    required this.icon,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                count,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
