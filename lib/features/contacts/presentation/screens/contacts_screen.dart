import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messenger/features/contacts/domain/call_model.dart';
import 'package:messenger/routes/routes_export.dart';
import 'package:messenger/shared/widgets/custom_appbar.dart';

enum ContactSortType { name, lastSeen }

ContactSortType sortType = ContactSortType.name;

class ContactsScreen extends ConsumerStatefulWidget {
  const ContactsScreen({super.key});

  @override
  ConsumerState<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends ConsumerState<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    final contacts = [
      CallModel(
        name: 'Alex Johnson',
        time: 'last seen Yesterday at 08:45 PM',
        isIncoming: true,
      ),
      CallModel(name: 'Emma Wilson', time: 'online', isIncoming: false),
      CallModel(
        name: 'John Doe',
        time: 'last seen Today at 10:24 AM',
        isIncoming: true,
      ),
      CallModel(
        name: 'Michael Smith',
        time: 'last seen Monday at 11:30 AM',
        isIncoming: true,
      ),
      CallModel(
        name: 'Sophia Brown',
        time: 'last seen Yesterday at 05:10 PM',
        isIncoming: false,
      ),
      CallModel(name: 'William Parker', time: 'online', isIncoming: true),
      CallModel(
        name: 'Olivia Davis',
        time: 'last seen recently',
        isIncoming: false,
      ),
    ];

    if (sortType == ContactSortType.name) {
      contacts.sort((a, b) => a.name.compareTo(b.name));
    } else {
      contacts.sort((a, b) {
        final aOnline = a.time.toLowerCase() == 'online';
        final bOnline = b.time.toLowerCase() == 'online';

        if (aOnline && !bOnline) return -1;
        if (!aOnline && bOnline) return 1;

        return a.name.compareTo(b.name);
      });
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Contacts',
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                sortType = sortType == ContactSortType.name
                    ? ContactSortType.lastSeen
                    : ContactSortType.name;
              });
            },
            icon: Icon(
              sortType == ContactSortType.name
                  ? Icons.sort_by_alpha
                  : Icons.access_time,
            ),
          ),
        ],
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: CupertinoButton.filled(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.person_add),
          onPressed: () {},
        ),
      ),

      body: ListView(
        children: [
          /// SEARCH
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: CupertinoTextField(placeholder: 'Search Contacts'),
          ),

          /// QUICK ACTIONS
          SettingsSection(
            children: [
              _actionTile(
                icon: Icons.group_outlined,
                title: 'New Group',
                onTap: () {},
              ),
              _actionTile(
                icon: Icons.lock_outline_rounded,
                title: 'New Secret Chat',
                onTap: () {},
              ),
              _actionTile(
                icon: Icons.campaign_outlined,
                title: 'New Channel',
                onTap: () {},
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 18, 24, 8),
            child: Text(
              sortType == ContactSortType.name
                  ? 'Sorted by name'
                  : 'Sorted by last seen time',
              // '${contacts.length} CONTACTS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
                letterSpacing: 1,
              ),
            ),
          ),

          SettingsSection(
            children: contacts
                .map(
                  (contact) => _contactTile(
                    context,
                    name: contact.name,
                    status: contact.time,
                    onTap: () {},
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }

  static Widget _actionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      dense: true,
      leading: Icon(icon, color: const Color(0xff229ED9)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      onTap: onTap,
    );
  }

  static Widget _contactTile(
    BuildContext context, {
    required String name,
    required String status,
    required VoidCallback onTap,
  }) {
    final isOnline = status.toLowerCase() == 'online';

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor:
            Colors.primaries[name.hashCode % Colors.primaries.length],
        child: Text(
          name[0].toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
      subtitle: Text(
        status,
        style: TextStyle(
          color: isOnline ? const Color(0xff229ED9) : Colors.grey.shade600,
        ),
      ),
      onTap: onTap,
    );
  }
}
