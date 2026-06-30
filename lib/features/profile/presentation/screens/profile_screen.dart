import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/routes/named_routes.dart';
import 'package:messenger/shared/widgets/custom_appbar.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _isHeaderCollapsed = false;
  bool _showPhotos = true;
  bool _showVideos = true;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final collapsed = _scrollController.offset > 250;

      if (collapsed != _isHeaderCollapsed) {
        setState(() {
          _isHeaderCollapsed = collapsed;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _isHeaderCollapsed
            ? SizedBox(
                height: 40,
                child: FloatingActionButton.extended(
                  onPressed: () {},
                  backgroundColor: const Color(0xff229ED9),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Add a post'),
                ),
              )
            : null,

        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () {
              context.push(NamedRoutes.myQR);
            },
            icon: const Icon(Icons.qr_code_2_rounded),
          ),
          title: 'Profile',
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                switch (value) {
                  case 'photos':
                    setState(() {
                      _showPhotos = !_showPhotos;
                    });
                    break;

                  case 'videos':
                    setState(() {
                      _showVideos = !_showVideos;
                    });
                    break;
                }
              },

              itemBuilder: (_) {
                if (_isHeaderCollapsed) {
                  return [
                    const PopupMenuItem(
                      value: 'search',
                      child: Row(
                        children: [
                          Icon(Icons.folder),
                          SizedBox(width: 12),
                          Text('Add Album'),
                        ],
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      value: 'archive',
                      child: Row(
                        children: [
                          Icon(Icons.zoom_in),
                          SizedBox(width: 12),
                          Text('Zoom In'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'archive',
                      child: Row(
                        children: [
                          Icon(Icons.zoom_out),
                          SizedBox(width: 12),
                          Text('Zoom Out'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'sort',
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month),
                          SizedBox(width: 12),
                          Text('Calendar'),
                        ],
                      ),
                    ),

                    const PopupMenuDivider(),

                    PopupMenuItem(
                      value: 'photos',
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            child: _showPhotos
                                ? const Icon(
                                    Icons.check,
                                    size: 18,
                                    color: Color(0xff229ED9),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 12),
                          const Text('Show Photos'),
                        ],
                      ),
                    ),

                    PopupMenuItem(
                      value: 'videos',
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            child: _showVideos
                                ? const Icon(
                                    Icons.check,
                                    size: 18,
                                    color: Color(0xff229ED9),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 12),
                          const Text('Show Videos'),
                        ],
                      ),
                    ),
                  ];
                }

                return const [
                  PopupMenuItem(
                    value: 'color',
                    child: Row(
                      children: [
                        Icon(Icons.color_lens_outlined),
                        SizedBox(width: 12),
                        Text('Change profile color'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'username',
                    child: Row(
                      children: [
                        Icon(Icons.alternate_email),
                        SizedBox(width: 12),
                        Text('Change username'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'link',
                    child: Row(
                      children: [
                        Icon(Icons.link),
                        SizedBox(width: 12),
                        Text('Copy link to profile'),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ],
        ),

        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 24),

                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 55,
                          child: Icon(Icons.person, size: 60),
                        ),

                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Color(0xff229ED9),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Rishabh',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      'online',
                      style: TextStyle(
                        color: Color(0xff229ED9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: _ActionCard(
                              icon: Icons.photo_camera_outlined,
                              label: 'Set Photo',
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _ActionCard(
                              icon: Icons.edit_outlined,
                              label: 'Edit Info',
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _ActionCard(
                              icon: Icons.settings_outlined,
                              label: 'Settings',
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: const [
                          ListTile(
                            leading: Icon(Icons.phone_outlined),
                            title: Text('+91 9876543210'),
                            subtitle: Text('Mobile'),
                          ),
                          Divider(height: 1),
                          ListTile(
                            leading: Icon(Icons.alternate_email),
                            title: Text('@rishabh'),
                            subtitle: Text('Username'),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),

              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarDelegate(
                  TabBar(
                    tabs: [
                      Tab(text: 'Posts'),
                      Tab(text: 'Archived Posts'),
                    ],
                  ),
                ),
              ),
            ];
          },

          body: const TabBarView(children: [_PostsTab(), _ArchivedPostsTab()]),
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: SizedBox(
          height: 84,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: const Color(0xff229ED9)),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _PostsTab extends StatelessWidget {
  const _PostsTab();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      itemCount: 10,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      child: Icon(Icons.person, size: 18),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rishabh',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Today at ${10 + index}:00 AM',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  'This is post #${index + 1}. '
                  'You can replace this with your actual Telegram-style profile posts, channel posts, announcements, images, videos, or media content.',
                  style: const TextStyle(height: 1.4),
                ),

                const SizedBox(height: 16),

                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade300,
                  ),
                  child: const Center(
                    child: Icon(Icons.image_outlined, size: 50),
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                      label: const Text('24'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.mode_comment_outlined),
                      label: const Text('8'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined),
                      label: const Text('Share'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ArchivedPostsTab extends StatelessWidget {
  const _ArchivedPostsTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.archive_outlined, size: 70, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'No Archived Posts',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Archived posts will appear here.',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
