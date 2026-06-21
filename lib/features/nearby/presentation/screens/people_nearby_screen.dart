import 'package:flutter/material.dart';

class PeopleNearbyScreen extends StatefulWidget {
  const PeopleNearbyScreen({super.key});

  @override
  State<PeopleNearbyScreen> createState() => _PeopleNearbyScreenState();
}

class _PeopleNearbyScreenState extends State<PeopleNearbyScreen> {
  final users = [
    const NearbyUser(name: 'John Doe', distance: '120 m away', isOnline: true),
    const NearbyUser(
      name: 'Emma Wilson',
      distance: '350 m away',
      isOnline: true,
    ),
    const NearbyUser(
      name: 'Michael Smith',
      distance: '1.2 km away',
      isOnline: false,
    ),
    const NearbyUser(
      name: 'Sophia Brown',
      distance: '2.5 km away',
      isOnline: false,
    ),
  ];

  final groups = [
    const NearbyGroup(
      name: 'Flutter Developers',
      members: 248,
      distance: '500 m away',
    ),
    const NearbyGroup(
      name: 'Bhopal Tech Community',
      members: 1350,
      distance: '1.8 km away',
    ),
  ];

  bool autoDownloadPhotos = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('People Nearby')),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(width: 8),
                    Text(
                      'Location Sharing',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Enable location access to discover people and local groups nearby.',
                ),
              ],
            ),
          ),

          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.radar)),
            title: const Text('Make Me Visible'),
            subtitle: const Text('Allow others nearby to find you'),
            trailing: Switch(
              value: autoDownloadPhotos,
              onChanged: (value) {
                setState(() {
                  autoDownloadPhotos = value;
                });
              },
            ),
          ),

          const Divider(),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'PEOPLE NEARBY',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),

          ...users.map(
            (user) => ListTile(
              leading: CircleAvatar(child: Text(user.name[0])),
              title: Text(user.name),
              subtitle: Text(user.distance),
              trailing: user.isOnline
                  ? const Chip(label: Text('Online'))
                  : null,
              onTap: () {},
            ),
          ),

          const Divider(),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'LOCAL GROUPS',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),

          ...groups.map(
            (group) => ListTile(
              leading: const CircleAvatar(child: Icon(Icons.groups)),
              title: Text(group.name),
              subtitle: Text('${group.members} members • ${group.distance}'),
              trailing: FilledButton(
                onPressed: () {},
                child: const Text('Join'),
              ),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.group_add),
        label: const Text('Create Local Group'),
      ),
    );
  }
}

class NearbyUser {
  final String name;
  final String distance;
  final bool isOnline;

  const NearbyUser({
    required this.name,
    required this.distance,
    required this.isOnline,
  });
}

class NearbyGroup {
  final String name;
  final int members;
  final String distance;

  const NearbyGroup({
    required this.name,
    required this.members,
    required this.distance,
  });
}
